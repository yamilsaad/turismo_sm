import 'package:get/get.dart';
import 'package:flutter/material.dart';

/// Controlador para gestionar el modo de tema (claro/oscuro/sistema) globalmente.
class ThemeController extends GetxController {
  /// Modo de tema actual
  var themeMode = ThemeMode.light.obs;

  /// Cambia el modo de tema
  void setTheme(ThemeMode mode) {
    themeMode.value = mode;
  }

  /// Alterna entre claro y oscuro
  void toggleTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
} 