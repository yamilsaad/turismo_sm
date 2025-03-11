import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactoViewMobile extends StatelessWidget {
  const ContactoViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.5,
      width: screenWidth * 1,
      color: Color(0xffEAFAEA),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.015),
              Center(
                child: Text(
                  "San Martín Turismo",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.065,
                      fontFamily: 'Poppins'),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.75,
                  child: Text(
                    "Vive una experiencia única",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.black, fontFamily: "Poppins"),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              // Links y Redes Sociales
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Enlaces rápidos
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _footerLink("Institucional"),
                      _footerLink("Autoridades"),
                      _footerLink("Nuestro proveedor"),
                      // _footerLink("Desing UX/UI"),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.025,
                  ),
                  // Redes Sociales
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon(FontAwesomeIcons.facebook),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      _socialIcon(FontAwesomeIcons.xTwitter),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      _socialIcon(FontAwesomeIcons.linkedin),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      _socialIcon(FontAwesomeIcons.instagram),
                    ],
                  ),
                ],
              ),
              Divider(
                height: screenHeight * 0.085,
                color: Colors.black,
              ),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: Text(
                    "© 2025 San Martín Turismo. Sitio web desarrollado por Soft Tech Solutions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black, fontSize: screenWidth * 0.035),
                  ),
                ),
              ),
            ],
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
