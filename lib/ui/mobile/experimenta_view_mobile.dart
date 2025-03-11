import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:turismo_sm/ui/mobile/component/button_mobile_component.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperimentaViewMobile extends StatefulWidget {
  const ExperimentaViewMobile({super.key});

  @override
  State<ExperimentaViewMobile> createState() => _ExperimentaViewMobileState();
}

class _ExperimentaViewMobileState extends State<ExperimentaViewMobile> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    final isMobile = _screenWidth < 600;

    return Container(
      color: Colors.black,
      width: _screenWidth, // Ajuste relativo al ancho
      height: _screenHeight,
      child: VisibilityDetector(
        key: Key('experiencia_mobile'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.2) {
            setState(() {
              _isVisible = true;
            });
          }
        },
        child: _isVisible
            ? SizedBox(
                child: Stack(
                  children: [
                    FadeIn(
                      duration: Duration(milliseconds: 1000),
                      child: Image.asset(
                        'assets/img/experimenta_fondo.webp',
                        width: _screenWidth,
                        height: _screenHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: _screenWidth * 0.1,
                      top: _screenHeight * 0.3,
                      child: Padding(
                        padding: EdgeInsets.only(right: _screenWidth * 0.02),
                        child: FadeIn(
                          duration: Duration(milliseconds: 1200),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: _screenHeight * 0.02),
                              ..._buildTextLines(context, isMobile),
                              SizedBox(height: _screenHeight * 0.02),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: _screenHeight * 0.8,
                      left: _screenWidth * 0.5,
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 2000),
                        child: Container(
                          //margin: EdgeInsets.only(bottom: screenHeight * 0.01),
                          color: Colors.transparent,
                          width: _screenWidth * 0.4, // Ancho del botón
                          height: _screenHeight * 0.06, // Altura del botón
                          child: const ButtonMobileComponent(),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }

  List<Widget> _buildTextLines(BuildContext context, bool isMobile) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

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
          width: _screenWidth * 0.6, // Ancho relativo
          child: Text(
            line,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile
                  ? _screenWidth * 0.06
                  : _screenWidth * 0.04, // Tamaño relativo
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      );
    }).toList();
  }
}
