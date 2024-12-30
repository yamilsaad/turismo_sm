import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 2500),
      child: SizedBox(
        height: 25.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.0),
              height: 15.0,
              width: 130.0,
              decoration: BoxDecoration(color: Colors.transparent
                  //Color(0xFF41B3A2)
                  ),
              child: Text(
                'San Martín Turismo',
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                height: 14.0,
                width: 130.0,
                decoration: BoxDecoration(
                  color: Color(0xFFA9B388),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5.0, top: 2, bottom: 2),
                  child: TextField(
                    style: TextStyle(
                        fontSize: 5.0), // Tamaño de la letra cuando se escribe
                    decoration: InputDecoration(
                      labelText: 'Busca tu destino',
                      labelStyle: TextStyle(
                          fontSize: 5.0), // Tamaño de la letra del label
                      border:
                          InputBorder.none, // Eliminar la línea de subrayado
                      isDense: true, // Reduce la altura interna del TextField
                      contentPadding:
                          EdgeInsets.all(0), // Ajusta el padding interno
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
