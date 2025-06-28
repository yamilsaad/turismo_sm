import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turismo_sm/domain/models/banner_model.dart';

/// Controlador GetX para la gestión de banners en la aplicación.
///
/// Permite obtener, agregar y eliminar banners desde Firestore.
/// Utiliza variables reactivas para el manejo eficiente del estado.
class BannerController extends GetxController {
  /// Lista reactiva de banners.
  var banners = <BannerModel>[].obs;
  /// Estado de carga de banners.
  var isLoading = false.obs;
  /// Índice actual del banner mostrado.
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (banners.isEmpty) {
      // Solo cargar si no hay banners
      fetchBanners();
    }
  }

  /// Obtiene todos los banners desde Firestore.
  Future<void> fetchBanners() async {
    if (isLoading.value) return;
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

  /// Actualiza el índice del banner actual para el carrusel.
  void updateCurrentBannerIndex() {
    if (banners.isNotEmpty) {
      currentIndex.value = (currentIndex.value + 1) % banners.length;
    }
  }

  /// Agrega un nuevo banner a Firestore y actualiza la lista.
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

  /// Elimina un banner de Firestore y actualiza la lista.
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
