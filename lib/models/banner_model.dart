class BannerModel {
  final String detalleBanner;
  final String fechaCreacion;
  final String fechaEliminacion;
  final String idGuardado;
  final String idBanner;
  final String imagenBanner;
  final String nombreBanner;
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

  // Método para crear una instancia de BannerModel desde un documento de Firestore
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

  // Método para convertir una instancia de BannerModel a un mapa
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
