import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController {
  var banners = <BannerModel>[].obs;
  var isLoading = false.obs;
  var currentIndex = 0.obs; // Índice actual del banner

  @override
  void onInit() {
    super.onInit();
    if (banners.isEmpty) {
      // Solo cargar si no hay banners
      fetchBanners();
    }
  }

  // Obtener todos los banners desde Firestore
  Future<void> fetchBanners() async {
    if (isLoading.value) return; // Evitar que se recargue si ya está cargando
    isLoading(true);
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('banners').get();
      banners.clear();
      for (var doc in snapshot.docs) {
        banners.add(BannerModel.fromMap(doc.data(), doc.id));
      }
    } catch (e) {
      print("Error al obtener banners: $e");
    } finally {
      isLoading(false);
    }
  }

  // Actualizar el índice del banner actual
  void updateCurrentBannerIndex() {
    if (banners.isNotEmpty) {
      currentIndex.value = (currentIndex.value + 1) % banners.length;
    }
  }

  // Agregar un nuevo banner a Firestore
  Future<void> addBanner(BannerModel banner) async {
    try {
      await FirebaseFirestore.instance
          .collection('banners')
          .add(banner.toMap());
      await fetchBanners();
    } catch (e) {
      print("Error al agregar banner: $e");
    }
  }

  // Eliminar un banner de Firestore
  Future<void> deleteBanner(String idBanner) async {
    try {
      await FirebaseFirestore.instance
          .collection('banners')
          .doc(idBanner)
          .delete();
      await fetchBanners();
    } catch (e) {
      print("Error al eliminar banner: $e");
    }
  }
}
