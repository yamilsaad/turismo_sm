import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ContactoViewMobile extends StatelessWidget {
  const ContactoViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20), // Espaciado interno
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffD5FFD0), Colors.white], // Colores del gradiente
          begin: Alignment.topCenter, // Punto de inicio del gradiente
          end: Alignment.bottomCenter, // Punto final del gradiente
        ),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: FadeInUp(
          duration: Duration(milliseconds: 2500),
          child: SizedBox(
            //color: Colors.amber,
            width: screenWidth * 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 4.0,
                ),
                Text(
                  'Contacto',
                  style: TextStyle(
                    fontSize: screenWidth * 4.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: screenHeight * 1.0),
                Text(
                  'Estamos aquí para ayudarte. Contáctanos a través de cualquiera de los siguientes medios:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 2.5,
                    color: Color(0XFF5F6F52),
                  ),
                ),
                SizedBox(height: screenHeight * 1.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.email,
                        color: Colors.black87,
                        size: screenWidth * 3.0,
                      ),
                      onPressed: () {
                        // Lógica para enviar un correo electrónico
                      },
                    ),
                    SizedBox(
                      width: screenWidth * 1.5,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.black87,
                        size: screenWidth * 3.0,
                      ),
                      onPressed: () {
                        // Lógica para hacer una llamada telefónica
                      },
                    ),
                    SizedBox(
                      width: screenWidth * 1.5,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.message,
                        color: Colors.black87,
                        size: screenWidth * 3.0,
                      ),
                      onPressed: () {
                        // Lógica para enviar un mensaje
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 2.0),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para abrir la app de correo o formulario de contacto
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 1.5,
                        vertical: screenHeight * 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.5),
                    ),
                  ),
                  child: Text(
                    'Enviar Mensaje',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 2.0,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 2.0),
                Text(
                  'Y síguenos en nuestras redes sociales',
                  style: TextStyle(
                    fontSize: screenWidth * 2.0,
                    color: Color(0XFF5F6F52),
                  ),
                ),
                SizedBox(height: screenHeight * 2.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: screenWidth * 3.0,
                      ),
                      onPressed: () {
                        // Lógica para redirigir a Facebook
                      },
                    ),
                    SizedBox(
                      width: screenWidth * 1.5,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.one_x_mobiledata_rounded,
                        color: Colors.lightBlue,
                        size: screenWidth * 3.0,
                      ),
                      onPressed: () {
                        // Lógica para redirigir a Twitter
                      },
                    ),
                    SizedBox(
                      width: screenWidth * 1.5,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.sports_soccer_outlined,
                        color: Colors.pinkAccent,
                        size: screenWidth * 3.0,
                      ),
                      onPressed: () {
                        // Lógica para redirigir a Instagram
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 4.0),
                Text(
                  '© 2025 San Martín Turismo. Todos los derechos reservados. Desarrollado por Soft Tech Solutions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 1.5,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
