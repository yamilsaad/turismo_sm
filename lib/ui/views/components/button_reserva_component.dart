import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ButtonReservaComponent extends StatelessWidget {
  const ButtonReservaComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 20,
      color: Color(0xffFF6600),
      onPressed: () {},
      child: Text(
        'Cómo llegar',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 6.0, color: Colors.white),
      ),
    );
  }
}
