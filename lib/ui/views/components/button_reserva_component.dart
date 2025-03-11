import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controller.dart';

class ButtonReservaComponent extends StatelessWidget {
  const ButtonReservaComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;

    final MapaController mapaController = Get.find<MapaController>();
    return TextButton(
      style:
          ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.orange)),
      onPressed: () =>
          mapaController.abrirMapa("San Martín, San Juan, Argentina"),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Cómo llegar',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: _screenWidth * 0.02, color: Colors.white),
        ),
      ),
    );
  }
}
