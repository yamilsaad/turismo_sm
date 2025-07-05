import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Si usas SVG: import 'package:flutter_svg/flutter_svg.dart';
// Si usas imágenes: import 'package:flutter/services.dart';

/// Centraliza todos los íconos usados en la app (Material, FontAwesome, SVG, PNG),
/// con etiquetas para accesibilidad y preparado para futuras extensiones.
class AppIcons {
  // =====================
  // Íconos Material
  // =====================
  static const IconData fabMain = Icons.add; // "Agregar"
  static const IconData map = Icons.map; // "Ver mapa"
  static const IconData zoomIn = Icons.zoom_in; // "Acercar"
  static const IconData zoomOut = Icons.zoom_out; // "Alejar"
  static const IconData interaction = Icons.touch_app; // "Activar interacción"
  // ...otros íconos Material

  // =====================
  // Colores centralizados para íconos de transporte y flechas
  // =====================
  static const Color transportIconColor = Colors.green; // Verde oscuro para auto, bus, avión y flechas

  // =====================
  // Íconos FontAwesome
  // =====================
  static const IconData houseChimney = FontAwesomeIcons.houseChimney; // "Casa"
  static const IconData car = FontAwesomeIcons.car; // "Auto"
  static const IconData bus = FontAwesomeIcons.bus; // "Bus"
  static const IconData plane = FontAwesomeIcons.plane; // "Avión"
  static const IconData angleUp = FontAwesomeIcons.angleUp; // "Arriba"
  static const IconData angleDown = FontAwesomeIcons.angleDown; // "Abajo"
  static const IconData angleLeft = FontAwesomeIcons.angleLeft; // "Izquierda"
  static const IconData angleRight = FontAwesomeIcons.angleRight; // "Derecha"
  static const IconData handPointer = FontAwesomeIcons.handPointer; // "Puntero mano"
  static const IconData magnifyingGlassPlus = FontAwesomeIcons.magnifyingGlassPlus; // "Zoom +"
  static const IconData magnifyingGlassMinus = FontAwesomeIcons.magnifyingGlassMinus; // "Zoom -"
  // ...agrega aquí los demás FontAwesome que uses

  // =====================
  // Ejemplo de uso para social icons (por si los necesitas en el futuro)
  // static const IconData facebook = FontAwesomeIcons.facebook;
  // static const IconData xTwitter = FontAwesomeIcons.xTwitter;
  // static const IconData linkedin = FontAwesomeIcons.linkedin;
  // static const IconData instagram = FontAwesomeIcons.instagram;

  // =====================
  // Íconos SVG personalizados (ejemplo)
  // =====================
  // static const String customSvg = 'assets/icons/custom_icon.svg';
  // Widget svgIcon({double size = 24}) => SvgPicture.asset(customSvg, width: size, height: size);

  // =====================
  // Íconos PNG/JPG personalizados (ejemplo)
  // =====================
  // static const String customPng = 'assets/icons/custom_icon.png';
  // Widget pngIcon({double size = 24}) => Image.asset(customPng, width: size, height: size);

  // =====================
  // Etiquetas para accesibilidad
  // =====================
  static String getLabel(dynamic icon) {
    // Material
    if (icon is IconData && icon.fontFamily == 'MaterialIcons') {
      switch (icon.codePoint) {
        case 0xe145:
          return "Agregar";
        case 0xe55b:
          return "Ver mapa";
        case 0xe8ff:
          return "Acercar";
        case 0xe900:
          return "Alejar";
        case 0xe913:
          return "Activar interacción";
        default:
          return "Ícono Material";
      }
    }
    // FontAwesome
    if (icon is IconData && icon.fontFamily == 'FontAwesomeSolid') {
      switch (icon.codePoint) {
        case 0xe3af:
          return "Casa";
        case 0xf1b9:
          return "Auto";
        case 0xf207:
          return "Bus";
        case 0xf072:
          return "Avión";
        case 0xf106:
          return "Arriba";
        case 0xf107:
          return "Abajo";
        case 0xf104:
          return "Izquierda";
        case 0xf105:
          return "Derecha";
        case 0xf25a:
          return "Puntero mano";
        case 0xf00e:
          return "Zoom +";
        case 0xf010:
          return "Zoom -";
        default:
          return "Ícono FontAwesome";
      }
    }
    // Si es SVG o PNG, puedes usar el nombre del archivo como etiqueta
    if (icon is String) {
      if (icon.endsWith('.svg')) return "Ícono SVG personalizado";
      if (icon.endsWith('.png') || icon.endsWith('.jpg')) return "Ícono imagen personalizado";
    }
    return "Ícono";
  }

  // =====================
  // Forzar inclusión de todos los íconos en el build web
  // =====================
  /// Llama a esta función en main() SOLO en debug o build web para forzar la inclusión de todos los íconos.
  static void preloadAllIcons() {
    // Lista de todos los IconData usados
    final icons = [
      fabMain, map, zoomIn, zoomOut, interaction,
      houseChimney, car, bus, plane, angleUp, angleDown, angleLeft, angleRight, handPointer, magnifyingGlassPlus, magnifyingGlassMinus
      // ...agrega aquí los demás íconos
    ];
    for (var icon in icons) {
      Icon(icon, size: 0.01);
    }
    // Si tienes SVG/PNG, puedes precargar aquí si es necesario
    // Ejemplo:
    // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, customSvg), context);
    // precacheImage(AssetImage(customPng), context);
  }
} 