import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turismo_sm/domain/models/hospedaje_model.dart';

class HospedajeController extends GetxController {
  var hospedajes = <HospedajeModel>[].obs;
  var isLoading = false.obs;

  final CollectionReference _hospedajesCollection =
      FirebaseFirestore.instance.collection('hospedajes');

  // Obtener todos los lugares desde Firestore
  @override
  void onInit() {
    super.onInit();
    fetchHospedajes();
  }

  // Obtener todos los hospedajes
  Future<void> fetchHospedajes() async {
    isLoading(true);
    try {
      final snapshot = await _hospedajesCollection.get();
      hospedajes.clear();
      for (var doc in snapshot.docs) {
        hospedajes.add(
            HospedajeModel.fromMap(doc.data() as Map<String, dynamic>, doc.id));
      }
    } catch (e) {
      print("Error al obtener hospedajes: $e");
    } finally {
      isLoading(false);
    }
  }

  // Crear un nuevo hospedaje
  Future<void> addHospedaje(HospedajeModel hospedaje) async {
    try {
      await _hospedajesCollection.add(hospedaje.toMap());
      await fetchHospedajes(); // Refrescar la lista
    } catch (e) {
      print("Error al agregar hospedaje: $e");
    }
  }

  // Actualizar un hospedaje existente
  Future<void> updateHospedaje(
      String idHospedaje, HospedajeModel hospedaje) async {
    try {
      await _hospedajesCollection.doc(idHospedaje).update(hospedaje.toMap());
      await fetchHospedajes(); // Refrescar la lista
    } catch (e) {
      print("Error al actualizar hospedaje: $e");
    }
  }

  // Eliminar un hospedaje
  Future<void> deleteHospedaje(String idHospedaje) async {
    try {
      await _hospedajesCollection.doc(idHospedaje).delete();
      await fetchHospedajes(); // Refrescar la lista
    } catch (e) {
      print("Error al eliminar hospedaje: $e");
    }
  }
}
