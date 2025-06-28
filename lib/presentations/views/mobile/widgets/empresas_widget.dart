import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class EmpresasWidget extends StatelessWidget {
  const EmpresasWidget({super.key});

  final List<Map<String, String>> agencias = const [
    {
      'nombre': 'Turismo Aventura',
      'descripcion': 'Especialistas en deportes extremos.',
      'imagen': 'assets/img/turismo1.png',
    },
    {
      'nombre': 'Viajes Relax',
      'descripcion': 'Vacaciones relajantes y confortables.',
      'imagen': 'assets/img/turismo2.png',
    },
    {
      'nombre': 'Explora el Mundo',
      'descripcion': 'Excursiones y experiencias únicas.',
      'imagen': 'assets/img/turismo3.png',
    },
    {
      'nombre': 'EcoTours',
      'descripcion': 'Ecoturismo y sostenibilidad.',
      'imagen': 'assets/img/turismo4.png',
    },
  ];

  void showAlert(BuildContext context, Map<String, String> agencia) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(agencia['nombre'] ?? 'Sin nombre'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (agencia['imagen'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  agencia['imagen']!,
                  fit: BoxFit.scaleDown,
                ),
              ),
            const SizedBox(height: 10),
            Text(agencia['descripcion'] ?? 'Sin descripción'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FadeIn(
      duration: const Duration(milliseconds: 1000),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comunícate con nuestras agencias...',
            style: TextStyle(fontSize: screenWidth * 0.05),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: screenHeight * 0.0005),
          SizedBox(
            height: screenHeight * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: agencias.length,
              itemBuilder: (context, index) {
                final agencia = agencias[index];
                return Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.02),
                  child: GestureDetector(
                    onTap: () => showAlert(context, agencia),
                    child: CircleAvatar(
                      radius: screenHeight * 0.05,
                      backgroundImage: AssetImage(agencia['imagen'] ?? ''),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
