import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class GuiasWidget extends StatelessWidget {
  const GuiasWidget({super.key});

  final List<Map<String, String>> guias = const [
    {
      'nombre': 'Juan Manuel',
      'descripcion': 'Guía de montaña con 10 años de experiencia',
      'telefono': '(0264)155262728',
      'imagen': 'assets/img/guia1.webp',
    },
    {
      'nombre': 'María José',
      'descripcion': 'Especialista en recorridos históricos',
      'telefono': '(0264)155262728',
      'imagen': 'assets/img/guia4.webp',
    },
    {
      'nombre': 'Carlos Ruiz',
      'descripcion': 'Experto en turismo de aventura',
      'telefono': '(0264)155262728',
      'imagen': 'assets/img/guia2.webp',
    },
    {
      'nombre': 'Carlos Saenz',
      'descripcion': 'Conocedor de flora y fauna local',
      'telefono': '(0264)155262728',
      'imagen': 'assets/img/guia3.webp',
    },
  ];

  void showAlert(BuildContext context, Map<String, String> guia) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(guia['nombre'] ?? 'Sin nombre'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (guia['imagen'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  guia['imagen']!,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 10),
            Text(guia['descripcion'] ?? 'Sin descripción'),
            const SizedBox(height: 5),
            Text(
              'Tel:${guia['telefono']}' ?? 'Sin Telefono',
              style: TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
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
      duration: const Duration(milliseconds: 800),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Busca un guía profesional...',
            style: TextStyle(fontSize: screenWidth * 0.05),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            height: screenHeight * 0.20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: guias.length,
              itemBuilder: (context, index) {
                final guia = guias[index];
                return Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.01),
                  child: Card(
                    elevation: 5.0,
                    child: GestureDetector(
                      onTap: () => showAlert(context, guia),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: SizedBox(
                          height: screenHeight * 0.20,
                          width: screenWidth * 0.25,
                          child: Column(
                            children: [
                              Image.asset(
                                guia['imagen'] ?? '',
                                fit: BoxFit.cover,
                                height: screenHeight * 0.12,
                                width: double.infinity,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  guia['nombre'] ?? '',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.030,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                'Guía...',
                                style: TextStyle(fontSize: screenWidth * 0.025),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
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
