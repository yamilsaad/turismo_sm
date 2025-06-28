import 'package:flutter/material.dart';

/// Helper para medidas responsivas y tamaños de fuente.
class ScreenHelper {
  /// Ancho de pantalla
  static double width(BuildContext context) => MediaQuery.of(context).size.width;

  /// Alto de pantalla
  static double height(BuildContext context) => MediaQuery.of(context).size.height;

  /// Calcula un tamaño de fuente responsivo basado en el ancho de pantalla
  static double fontSize(BuildContext context, double factor, {double min = 12, double max = 32}) {
    final w = width(context);
    return (w * factor).clamp(min, max);
  }

  /// Calcula un tamaño de contenedor responsivo basado en el ancho de pantalla
  static double containerWidth(BuildContext context, double percent) {
    return width(context) * percent;
  }

  /// Calcula un tamaño de contenedor responsivo basado en el alto de pantalla
  static double containerHeight(BuildContext context, double percent) {
    return height(context) * percent;
  }
} 