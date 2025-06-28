/// Modelo de datos para un lugar turístico.
///
/// Contiene información relevante como nombre, ubicación, imágenes y detalles.
class LugarModel {
  /// Nombre del lugar turístico.
  final String nombreLugar;
  /// Descripción o detalle del lugar.
  final String detalleLugar;
  /// Ubicación geográfica o dirección del lugar.
  final String ubicacionLugar;
  /// Fecha de creación del registro.
  final String fechaCreacion;
  /// Fecha de última actualización del registro.
  final String fechaActualizacion;
  /// Subtítulo o frase corta del lugar.
  final String subtituloLugar;
  /// Identificador único del lugar.
  final String idLugar;
  /// URL o ruta de la imagen principal del lugar.
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

  /// Crea una instancia de LugarModel desde un mapa (por ejemplo, de Firestore).
  factory LugarModel.fromMap(Map<String, dynamic> data, String documentId) {
    return LugarModel(
      nombreLugar: data['nombre_lugar'] ?? '',
      detalleLugar: data['detalle_lugar'] ?? '',
      ubicacionLugar: data['ubicacion_lugar'] ?? '',
      fechaCreacion: data['fecha_creacion'] ?? '',
      fechaActualizacion: data['fecha_actualizacion'] ?? '',
      subtituloLugar: data['subtitulo_lugar'] ?? '',
      idLugar: data['id_lugar'] ?? '',
      imagenPrincipal: data['imagen_principal'] ?? '',
    );
  }

  /// Convierte una instancia de LugarModel a un mapa para guardar en Firestore.
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
