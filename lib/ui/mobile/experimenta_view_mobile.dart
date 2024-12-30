import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:turismo_sm/ui/mobile/component/button_mobile_component.dart';

class ExperimentaViewMobile extends StatelessWidget {
  const ExperimentaViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;

    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: screenWidth * 0.9, // Ajuste relativo al ancho
        child: FadeIn(
          duration: const Duration(milliseconds: 2000),
          child: Stack(
            children: [
              Image.asset(
                'assets/img/experimenta_fondo.webp',
                width: screenWidth,
                height: screenHeight,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: screenWidth * 0.1,
                top: screenHeight * 0.3,
                child: Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: screenHeight * 0.02),
                      ..._buildTextLines(context, isMobile),
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.6,
                left: screenWidth * 0.4,
                child: FadeInUp(
                  duration: const Duration(milliseconds: 2000),
                  child: Container(
                    //margin: EdgeInsets.only(bottom: screenHeight * 0.01),
                    color: Colors.transparent,
                    width: screenWidth * 0.4, // Ancho del botón
                    height: screenHeight * 0.06, // Altura del botón
                    child: const ButtonMobileComponent(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextLines(BuildContext context, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final textLines = [
      '¡Vive experiencias únicas!',
      'Conéctate con la naturaleza',
      'Descubre la calidez de sus habitantes',
      'Disfruta de la mejor gastronomía local',
      '¡Vení a vivir San Martín!',
    ];

    return textLines.map((line) {
      return FadeIn(
        duration: const Duration(milliseconds: 1200),
        child: SizedBox(
          width: screenWidth * 0.6, // Ancho relativo
          child: Text(
            line,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile
                  ? screenWidth * 0.04
                  : screenWidth * 0.03, // Tamaño relativo
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      );
    }).toList();
  }
}
