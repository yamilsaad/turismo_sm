import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:turismo_sm/ui/views/widgets/elegante_adorne_widget.dart';
import 'widgets/widget.dart';

class LugaresView extends StatelessWidget {
  const LugaresView({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppbarLugaresWidget(),
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FadeIn(
                  duration: const Duration(milliseconds: 1000),
                  child: const LugaresGridWidget())),
          FadeIn(
              duration: Duration(milliseconds: 1000),
              child: const ElegantAdornedWidget())
        ],
      ),
    );
  }
}

class AppbarLugaresWidget extends StatelessWidget {
  const AppbarLugaresWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 2500),
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3.0),
          //color: Colors.amber,
          height: 12,
          width: 200,
          child: const Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Conoce tu lugar en San Martín:',
                    style:
                        TextStyle(fontSize: 5.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sé parte de la historia de nuestra tierra',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 2.5,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        color: Color(0XFF5F6F52)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
