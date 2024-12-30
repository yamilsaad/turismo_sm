import 'package:flutter/material.dart';

class ButtonMobileComponent extends StatelessWidget {
  const ButtonMobileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener las dimensiones de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.15, // Ajuste relativo al ancho de la pantalla
      height: screenHeight * 0.020, // Ajuste relativo al alto de la pantalla
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.orange),
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            'Cómo llegar',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.04, // Ajuste relativo al ancho
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}