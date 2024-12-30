import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ContactoView extends StatelessWidget {
  const ContactoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20), // Espaciado interno
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffD5FFD0), Colors.white], // Colores del gradiente
          begin: Alignment.topCenter, // Punto de inicio del gradiente
          end: Alignment.bottomCenter, // Punto final del gradiente
        ),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: FadeInUp(
            duration: Duration(milliseconds: 2500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Contacto',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Estamos aquí para ayudarte. Contáctanos a través de cualquier medio.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0XFF5F6F52),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.email, color: Colors.black87),
                      onPressed: () {
                        // Lógica para enviar un correo electrónico
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.phone, color: Colors.black87),
                      onPressed: () {
                        // Lógica para hacer una llamada telefónica
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.message, color: Colors.black87),
                      onPressed: () {
                        // Lógica para enviar un mensaje
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para abrir la app de correo o formulario de contacto
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Enviar Mensaje',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'O síguenos en nuestras redes sociales',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0XFF5F6F52),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook, color: Colors.blue),
                      onPressed: () {
                        // Lógica para redirigir a Facebook
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.one_x_mobiledata_rounded,
                          color: Colors.lightBlue),
                      onPressed: () {
                        // Lógica para redirigir a Twitter
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.sports_soccer_outlined,
                          color: Colors.pinkAccent),
                      onPressed: () {
                        // Lógica para redirigir a Instagram
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  '© 2024 San Martín Turismo. Todos los derechos reservados. Desarrollado por Soft Tech Solutions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
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
