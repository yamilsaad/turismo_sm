import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController {
  var banners = <BannerModel>[].obs;
  var isLoading = false.obs;
  var currentIndex = 0.obs; // Índice actual del banner

  // Obtener todos los banners desde Firestore
  Future<void> fetchBanners() async {
    isLoading(true);
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('banners').get();
      banners.clear();
      for (var doc in snapshot.docs) {
        print(doc.data()); // Ver los datos en la consola
        banners.add(BannerModel.fromMap(doc.data(), doc.id));
      }
      print("Número de banners obtenidos: ${banners.length}");
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
