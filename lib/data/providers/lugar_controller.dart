import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turismo_sm/domain/models/lugar_model.dart';

/// Controlador GetX para la gestión de lugares turísticos.
///
/// Permite obtener, agregar, actualizar y eliminar lugares desde Firestore.
/// Utiliza variables reactivas para el manejo eficiente del estado.
class LugarController extends GetxController {
  /// Lista reactiva de lugares turísticos.
  var lugares = <LugarModel>[].obs;
  /// Estado de carga de lugares.
  var isLoading = false.obs;

  /// Obtiene todos los lugares desde Firestore.
  @override
  void onInit() {
    super.onInit();
    fetchLugares().then((_) {
      print("Lugares cargados correctamente.");
    }).catchError((error) {
      print("Error al cargar los lugares: $error");
    });
  }

  /// Obtiene la lista de lugares desde Firestore y la actualiza.
  Future<void> fetchLugares() async {
    isLoading(true);
    try {
      print("Intentando obtener datos de 'lugares'...");
      final snapshot =
          await FirebaseFirestore.instance.collection('lugares').get();
      if (snapshot.docs.isEmpty) {
        print("La colección 'lugares' está vacía o no tiene documentos.");
      } else {
        print("Documentos encontrados: ${snapshot.docs.length}");
      }
      lugares.clear();
      for (var doc in snapshot.docs) {
        print("Documento ID: ${doc.id}, Datos: ${doc.data()}");
        lugares.add(LugarModel.fromMap(doc.data(), doc.id));
      }
      print("Número de lugares obtenidos: ${lugares.length}");
    } catch (e) {
      print("Error al obtener lugares: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Agrega un nuevo lugar a Firestore y actualiza la lista.
  Future<void> addLugar(LugarModel lugar) async {
    try {
      await FirebaseFirestore.instance.collection('lugares').add(lugar.toMap());
      await fetchLugares();
    } catch (e) {
      print("Error al agregar lugar: $e");
    }
  }

  /// Actualiza un lugar existente en Firestore y refresca la lista.
  Future<void> updateLugar(String idLugar, LugarModel lugar) async {
    try {
      await FirebaseFirestore.instance
          .collection('lugares')
          .doc(idLugar)
          .update(lugar.toMap());
      await fetchLugares();
    } catch (e) {
      print("Error al actualizar lugar: $e");
    }
  }

  /// Elimina un lugar de Firestore y actualiza la lista.
  Future<void> deleteLugar(String idLugar) async {
    try {
      await FirebaseFirestore.instance
          .collection('lugares')
          .doc(idLugar)
          .delete();
      await fetchLugares();
    } catch (e) {
      print("Error al eliminar lugar: $e");
    }
  }
}
