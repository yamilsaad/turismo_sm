import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turismo_sm/data/providers/mapa_controller.dart';

class ButtonMobileComponent extends StatelessWidget {
  const ButtonMobileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener las dimensiones de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final MapaController _mapaController = Get.find<MapaController>();

    return SizedBox(
      width: screenWidth * 0.15, // Ajuste relativo al ancho de la pantalla
      height: screenHeight * 0.020, // Ajuste relativo al alto de la pantalla
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.orange),
          backgroundColor: WidgetStateProperty.all(Colors.orange),
        ),
        onPressed: () =>
            _mapaController.abrirMapa("San Martín, San Juan, Argentina"),
        child: Center(
          child: Text(
            'Cómo llegar',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.04, // Ajuste relativo al ancho
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
