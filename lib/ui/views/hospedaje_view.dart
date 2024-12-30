import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turismo_sm/routers/fluro_router.dart';

class HospedajesView extends StatelessWidget {
  const HospedajesView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('hospedajes').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error al cargar los hospedajes.'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No hay hospedajes disponibles.'));
        }

        final hospedajes = snapshot.data!.docs;

        return SizedBox(
          height: MediaQuery.of(context).size.height / 8.0, // Altura ajustada
          width: MediaQuery.of(context).size.width / 4.0, // Altura ajustada
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hospedajes.length,
            itemBuilder: (context, index) {
              final data = hospedajes[index].data() as Map<String, dynamic>;
              return _HospedajeCard(
                nombre: data['nombre_hospedaje'] ?? '',
                detalle: data['detalle_hospedaje'] ?? '',
                imagen: data['imagen_principal'] ?? '',
                onTap: () {
                  Flurorouter.router.navigateTo(
                    context,
                    '/detalle-hospedaje/${hospedajes[index].id}',
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _HospedajeCard extends StatefulWidget {
  final String nombre;
  final String detalle;
  final String imagen;
  final VoidCallback onTap;

  const _HospedajeCard({
    required this.nombre,
    required this.detalle,
    required this.imagen,
    required this.onTap,
    super.key,
  });

  @override
  State<_HospedajeCard> createState() => _HospedajeCardState();
}

class _HospedajeCardState extends State<_HospedajeCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: MediaQuery.of(context).size.width / 4.0, // Ancho ajustado
          height: MediaQuery.of(context).size.height / 8.0, // Altura ajustada
          //margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  transform: Matrix4.identity()
                    ..scale(isHovered ? 1.1 : 1.0), // Zoom al hover
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.imagen),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(isHovered ? 0.9 : 0.5),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              if (isHovered) ...[
                Positioned(
                  bottom: 150,
                  left: 10,
                  right: 10,
                  child: Text(
                    widget.detalle.length > 50
                        ? '${widget.detalle.substring(0, 50)}...'
                        : widget
                            .detalle, // Muestra solo los primeros 50 caracteres
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              Positioned(
                bottom: 60,
                left: 10,
                right: 10,
                child: Text(
                  widget.nombre,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

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
        title: Text('Detalle del Hospedaje'),
        backgroundColor: Color(0xffFF6600),
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
          final imagen = data['imagen_principal'] ??
              'https://via.placeholder.com/150'; // Imagen por defecto
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
*/