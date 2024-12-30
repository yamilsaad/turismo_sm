import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/lugar_model.dart';

class LugarController extends GetxController {
  var lugares = <LugarModel>[].obs;
  var isLoading = false.obs;

  // Obtener todos los lugares desde Firestore
  @override
  void onInit() {
    super.onInit();
    fetchLugares();
  }

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

  // Agregar un nuevo lugar a Firestore
  Future<void> addLugar(LugarModel lugar) async {
    try {
      await FirebaseFirestore.instance.collection('lugares').add(lugar.toMap());
      await fetchLugares(); // Refrescar la lista de lugares
    } catch (e) {
      print("Error al agregar lugar: $e");
    }
  }

  // Actualizar un lugar en Firestore
  Future<void> updateLugar(String idLugar, LugarModel lugar) async {
    try {
      await FirebaseFirestore.instance
          .collection('lugares')
          .doc(idLugar)
          .update(lugar.toMap());
      await fetchLugares(); // Refrescar la lista de lugares
    } catch (e) {
      print("Error al actualizar lugar: $e");
    }
  }

  // Eliminar un lugar de Firestore
  Future<void> deleteLugar(String idLugar) async {
    try {
      await FirebaseFirestore.instance
          .collection('lugares')
          .doc(idLugar)
          .delete();
      await fetchLugares(); // Refrescar la lista de lugares
    } catch (e) {
      print("Error al eliminar lugar: $e");
    }
  }
}
