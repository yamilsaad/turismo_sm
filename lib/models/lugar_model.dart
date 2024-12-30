// Modelo para la colección "lugares"
class LugarModel {
  final String nombreLugar;
  final String detalleLugar;
  final String ubicacionLugar;
  final String fechaCreacion;
  final String fechaActualizacion;
  final String subtituloLugar;
  final String idLugar;
  final String imagenPrincipal;

  LugarModel({
    required this.nombreLugar,
    required this.detalleLugar,
    required this.ubicacionLugar,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.subtituloLugar,
    required this.idLugar,
    required this.imagenPrincipal,
  });

  // Crear una instancia de LugarModel desde un mapa
  factory LugarModel.fromMap(Map<String, dynamic> data, String documentId) {
    return LugarModel(
      nombreLugar: data['nombre_lugar'] ?? '',
      detalleLugar: data['detalle_lugar'] ?? '',
      ubicacionLugar: data['ubicacion_lugar'] ?? '',
      fechaCreacion: data['fecha_creacion'] ?? '',
      fechaActualizacion: data['fecha_actualizacion'] ?? '',
      subtituloLugar: data['subtitulo_lugar'] ?? '',
      idLugar: data['id_lugar'] ?? '', // Se usa directamente del mapa
      imagenPrincipal: data['imagen_principal'] ?? '',
    );
  }

  // Convertir una instancia de LugarModel a un mapa
  Map<String, dynamic> toMap() {
    return {
      'nombre_lugar': nombreLugar,
      'detalle_lugar': detalleLugar,
      'ubicacion_lugar': ubicacionLugar,
      'fecha_creacion': fechaCreacion,
      'fecha_actualizacion': fechaActualizacion,
      'subtitulo_lugar': subtituloLugar,
      'imagen_principal': imagenPrincipal,
      'id_lugar': idLugar
    };
  }
}
