/// Modelo de datos para un banner promocional.
///
/// Contiene información relevante como detalle, fechas, imagen y usuario asociado.
class BannerModel {
  /// Descripción o detalle del banner.
  final String detalleBanner;
  /// Fecha de creación del banner.
  final String fechaCreacion;
  /// Fecha de eliminación (si aplica).
  final String fechaEliminacion;
  /// Identificador guardado en la base de datos.
  final String idGuardado;
  /// Identificador único del banner.
  final String idBanner;
  /// URL o ruta de la imagen del banner.
  final String imagenBanner;
  /// Nombre del banner.
  final String nombreBanner;
  /// Usuario asociado al banner.
  final String usuarioBanner;

  BannerModel({
    required this.detalleBanner,
    required this.fechaCreacion,
    required this.fechaEliminacion,
    required this.idGuardado,
    required this.idBanner,
    required this.imagenBanner,
    required this.nombreBanner,
    required this.usuarioBanner,
  });

  /// Crea una instancia de BannerModel desde un mapa (por ejemplo, de Firestore).
  factory BannerModel.fromMap(Map<String, dynamic> data, String documentId) {
    return BannerModel(
      detalleBanner: data['detalle_banner'] ?? '',
      fechaCreacion: data['fecha_creacion'] ?? '',
      fechaEliminacion: data['fecha_eliminacion'] ?? '',
      idGuardado: data['id_banner'] ?? '',
      idBanner: documentId,
      imagenBanner: data['imagen_banner'] ?? '',
      nombreBanner: data['nombre_banner'] ?? '',
      usuarioBanner: data['usuario_banner'] ?? '',
    );
  }

  /// Convierte una instancia de BannerModel a un mapa para guardar en Firestore.
  Map<String, dynamic> toMap() {
    return {
      'detalle_banner': detalleBanner,
      'fecha_creacion': fechaCreacion,
      'fecha_eliminacion': fechaEliminacion,
      'id_banner': idGuardado,
      'imagen_banner': imagenBanner,
      'nombre_banner': nombreBanner,
      'usuario_banner': usuarioBanner,
    };
  }
}
