import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:turismo_sm/ui/views/components/button_reserva_component.dart';

class ExperimentaView extends StatelessWidget {
  const ExperimentaView({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: 500,
          child: FadeIn(
            duration: Duration(milliseconds: 2000),
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
                      duration: Duration(milliseconds: 1200),
                      child: Container(
                          //color: Colors.amber,
                          height: 20,
                          width: 170,
                          child: Text(
                            '#Recoge nuevas experiencias',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 1500),
                      child: Container(
                          //color: Colors.green,
                          height: 20,
                          width: 250,
                          child: Text(
                            '#Conéctate con la naturaleza',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                          //color: Colors.green,
                          height: 20,
                          width: 300,
                          child: Text(
                            '#Descubre la calidez de tus vecinos',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 2200),
                      child: Container(
                          //color: Colors.green,
                          height: 20,
                          width: 250,
                          child: Text(
                            '#Disfruta de la mejor comida sanjuanina',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 2500),
                      child: Container(
                          //color: Colors.green,
                          height: 20,
                          width: 200,
                          child: Text(
                            '#Viví San Martín',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5.0),
                        color: Colors.transparent,
                        width: 400,
                        height: 20,
                        child: Row(
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
