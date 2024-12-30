import 'package:cloud_firestore/cloud_firestore.dart';

class HospedajeModel {
  String idHospedaje;
  String nombreHospedaje;
  String detalleHospedaje;
  String imagenPrincipal;
  String imagenDos;
  String imagenTres;
  String imagenCuatro;
  String instagramHospedaje;
  String telefonoHospedaje;
  String ubicacionHospedaje;
  String webHospedaje;
  String domicilioHospedaje;
  String horarioHospedaje;

  HospedajeModel({
    required this.idHospedaje,
    required this.nombreHospedaje,
    required this.detalleHospedaje,
    required this.imagenPrincipal,
    this.imagenDos = '',
    this.imagenTres = '',
    this.imagenCuatro = '',
    this.instagramHospedaje = '',
    this.telefonoHospedaje = '',
    this.ubicacionHospedaje = '',
    this.webHospedaje = '',
    this.domicilioHospedaje = '',
    this.horarioHospedaje = '',
  });

  // Convertir un documento Firestore a un objeto HospedajeModel
  factory HospedajeModel.fromMap(Map<String, dynamic> data, String documentId) {
    return HospedajeModel(
      idHospedaje: documentId,
      nombreHospedaje: data['nombre_hospedaje'] ?? '',
      detalleHospedaje: data['detalle_hospedaje'] ?? '',
      imagenPrincipal: data['imagen_principal'] ?? '',
      imagenDos: data['imagen_dos'] ?? '',
      imagenTres: data['imagen_tres'] ?? '',
      imagenCuatro: data['imagen_cuatro'] ?? '',
      instagramHospedaje: data['instagram_hospedaje'] ?? '',
      telefonoHospedaje: data['telefono_hospedaje'] ?? '',
      ubicacionHospedaje: data['ubicacion_hospedaje'] ?? '',
      webHospedaje: data['web_hospedaje'] ?? '',
      domicilioHospedaje: data['domicilio_hospedaje'] ?? '',
      horarioHospedaje: data['horario_hospedaje'] ?? '',
    );
  }

  // Convertir un objeto HospedajeModel a un mapa para Firestore
  Map<String, dynamic> toMap() {
    return {
      'nombre_hospedaje': nombreHospedaje,
      'detalle_hospedaje': detalleHospedaje,
      'imagen_principal': imagenPrincipal,
      'imagen_dos': imagenDos,
      'imagen_tres': imagenTres,
      'imagen_cuatro': imagenCuatro,
      'instagram_hospedaje': instagramHospedaje,
      'telefono_hospedaje': telefonoHospedaje,
      'ubicacion_hospedaje': ubicacionHospedaje,
      'web_hospedaje': webHospedaje,
      'domicilio_hospedaje': domicilioHospedaje,
      'horario_hospedaje': horarioHospedaje,
    };
  }
}
