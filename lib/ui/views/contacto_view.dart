import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactoView extends StatelessWidget {
  const ContactoView({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height * 0.35;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: _screenHeight,
      width: _screenWidth,
      color: Color(0xffEAFAEA),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Links y Redes Sociales
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo y Descripción
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "San Martín Turismo",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: _screenWidth * 0.02,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: _screenHeight * 0.01),
                  SizedBox(
                    width: _screenWidth * 0.15,
                    child: Text(
                      "¡Vive una experiencia única!",
                      style:
                          TextStyle(color: Colors.black, fontFamily: "Poppins"),
                    ),
                  ),
                ],
              ),

              // Enlaces rápidos
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _footerLink("Institucional"),
                  SizedBox(
                    width: _screenWidth * 0.025,
                  ),
                  _footerLink("Autoridades"),
                  SizedBox(
                    width: _screenWidth * 0.025,
                  ),
                  _footerLink("Nuestro proveedor"),
                ],
              ),

              // Redes Sociales
              Row(
                children: [
                  _socialIcon(FontAwesomeIcons.facebook),
                  _socialIcon(FontAwesomeIcons.xTwitter),
                  _socialIcon(FontAwesomeIcons.linkedin),
                  _socialIcon(FontAwesomeIcons.instagram),
                ],
              ),
            ],
          ),
          SizedBox(height: _screenHeight * 0.025),
          // Línea divisoria y Derechos
          Divider(color: Colors.grey),
          SizedBox(height: _screenWidth * 0.035),
          Center(
            child: Text(
              "© 2025 San Martín Turismo. Sitio desarrollado por Soft Tech Solutions.",
              style: TextStyle(
                  color: Colors.black, fontSize: _screenWidth * 0.012),
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Icon(icon, color: Colors.black, size: 22),
    );
  }
}
