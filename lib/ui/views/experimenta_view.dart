import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:turismo_sm/ui/views/components/button_reserva_component.dart';

class ExperimentaView extends StatelessWidget {
  const ExperimentaView({super.key});

  @override
  Widget build(BuildContext context) {
    final _textLine = [
      '¡Vive experiencias únicas!',
      'Conéctate con la naturaleza',
      'Descubre la calidez de sus habitantes',
      'Disfruta de la mejor gastronomía local',
      '¡Vení a vivir San Martín!',
    ];

    return FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: 500,
          child: FadeIn(
            duration: const Duration(milliseconds: 2000),
            child: Stack(children: [
              Image.asset('assets/img/experimenta_fondo.webp'),
              Positioned(
                top: 40,
                left: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeIn(
                      duration: const Duration(milliseconds: 1200),
                      child: SizedBox(
                          //color: Colors.amber,
                          height: 100,
                          width: 300,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _textLine
                                  .map((line) => Text(
                                        line,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.start,
                                      ))
                                  .toList())),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 2000),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5.0),
                        color: Colors.transparent,
                        width: 400,
                        height: 20,
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
            ]),
          ),
        ));
  }
}
