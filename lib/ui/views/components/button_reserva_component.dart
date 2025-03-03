import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ButtonReservaComponent extends StatelessWidget {
  const ButtonReservaComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return TextButton(
      style:
          ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.orange)),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Cómo llegar',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: _screenWidth * 0.02, color: Colors.white),
        ),
      ),
    );
  }
}
