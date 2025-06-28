import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../configs/routers/app_route.dart';

class DetalleHospedajeScreen extends StatelessWidget {
  final String hospedajeId;

  const DetalleHospedajeScreen({
    required this.hospedajeId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.offNamed('/inicio');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/img/logo_turismo2.webp')),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "San Martín Turismo",
                style: TextStyle(
                  color: Color(0xff8FD14F),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Center(
                child: TextField(
                  cursorColor: Colors.black, // Color del cursor
                  decoration: InputDecoration(
                    hintText: 'Buscar en el sitio web...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(
                            0xffD7E4C0), // Color del borde cuando no está enfocado
                        width: 0.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors
                            .green, // Color del borde cuando está enfocado
                        width: 0.8,
                      ),
                    ),
                  ),
                  onSubmitted: (query) {
                    // Lógica de búsqueda aquí
                  },
                  selectionControls:
                      MaterialTextSelectionControls(), // Controla el color de la selección
                  style:
                      const TextStyle(color: Colors.black), // Color del texto
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('hospedajes')
            .doc(hospedajeId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los detalles.'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No se encontró el hospedaje.'));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;
          final nombre = data['nombre_hospedaje'] ?? 'Nombre no disponible';
          final detalle = data['detalle_hospedaje'] ?? 'Sin descripción';
          final imagen =
              data['imagen_principal'] ?? 'https://via.placeholder.com/150';
          final domicilio = data['domicilio_hospedaje'] ?? '';
          final horario = data['horario_hospedaje'] ?? '';
          final telefono = data['telefono_hospedaje'] ?? '';
          final web = data['web_hospedaje'] ?? '';
          final instagram = data['instagram_hospedaje'] ?? '';

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nombre,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff604CC3),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              detalle,
                              style: TextStyle(
                                fontSize: 16.0,
                                height: 1.5,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 16.0),
                            if (domicilio.isNotEmpty)
                              Text(
                                'Domicilio: $domicilio',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                            if (horario.isNotEmpty)
                              Text(
                                'Horario: $horario',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                            if (telefono.isNotEmpty)
                              Text(
                                'Teléfono: $telefono',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                            if (web.isNotEmpty)
                              TextButton(
                                onPressed: () {
                                  // Acción para abrir la web
                                },
                                child: Text(
                                  'Sitio Web: $web',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            if (instagram.isNotEmpty)
                              TextButton(
                                onPressed: () {
                                  // Acción para abrir Instagram
                                },
                                child: Text(
                                  'Instagram: $instagram',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            imagen,
                            height: 500.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Divider(),
                  Center(
                    child: Text(
                      'Gracias por elegirnos para planificar tu viaje.',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Text(
                      '© 2024 Turismo SM. Todos los derechos reservados.',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
