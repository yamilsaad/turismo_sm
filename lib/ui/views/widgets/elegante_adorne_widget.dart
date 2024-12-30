import 'package:flutter/material.dart';

class ElegantAdornedWidget extends StatelessWidget {
  const ElegantAdornedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.eco,
            color: Colors.green.shade700, size: 8), // Hoja izquierda
        Container(
          width: 80, // Tamaño fijo para la línea
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          height: 1,
          color: Colors.grey.shade400, // Línea delgada
        ),
        Container(
          width: 3,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.green.shade700,
            shape: BoxShape.circle,
          ), // Ornamento central
        ),
        Container(
          width: 80, // Tamaño fijo para la línea
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          height: 1,
          color: Colors.grey.shade400, // Línea delgada
        ),
        Icon(Icons.eco, color: Colors.green.shade700, size: 8), // Hoja derecha
      ],
    );
  }
}
