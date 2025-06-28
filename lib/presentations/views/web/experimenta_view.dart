import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:turismo_sm/presentations/views/web/components/button_reserva_component.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:turismo_sm/core/helpers/screen_helper.dart';

class ExperimentaView extends StatefulWidget {
  const ExperimentaView({super.key});

  @override
  State<ExperimentaView> createState() => _ExperimentaViewState();
}

class _ExperimentaViewState extends State<ExperimentaView> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final _screenHeight = ScreenHelper.height(context);
    final _screenWidth = ScreenHelper.width(context);
    final _textLine = [
      '¡Vive experiencias únicas!',
      'Conéctate con la naturaleza',
      'Descubre la calidez de sus habitantes',
      'Disfruta de la mejor gastronomía local',
      '¡Vení a vivir San Martín!',
    ];

    return Container(
      color: Colors.black,
      width: _screenWidth,
      height: _screenHeight,
      child: VisibilityDetector(
        key: Key('inicio_web'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.2) {
            setState(() {
              _isVisible = true;
            });
          }
        },
        child: _isVisible
            ? Stack(children: [
                SizedBox(
                    width: _screenWidth,
                    height: _screenHeight,
                    child: FadeIn(
                      duration: Duration(milliseconds: 1000),
                      child: Image.asset(
                        'assets/img/experimenta_fondo.webp',
                        fit: BoxFit.cover,
                      ),
                    )),
                Positioned(
                  top: ScreenHelper.containerHeight(context, 0.04),
                  left: ScreenHelper.containerWidth(context, 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeIn(
                        duration: const Duration(milliseconds: 1200),
                        child: SizedBox(
                            //color: Colors.amber,
                            height: ScreenHelper.containerHeight(context, 0.65),
                            width: ScreenHelper.containerWidth(context, 0.5),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _textLine
                                    .map((line) => FadeIn(
                                          duration: const Duration(
                                              milliseconds: 1300),
                                          child: Text(
                                            line,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenHelper.fontSize(context, 0.03, min: 16, max: 36),
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.start,
                                          ),
                                        ))
                                    .toList())),
                      ),
                      SizedBox(
                        height: ScreenHelper.containerHeight(context, 0.075),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 2000),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          color: Colors.transparent,
                          width: ScreenHelper.containerWidth(context, 0.45),
                          height: ScreenHelper.containerHeight(context, 0.25),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ButtonReservaComponent(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])
            : Container(),
      ),
    );
  }
}
