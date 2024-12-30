import 'package:flutter/material.dart';
import 'package:turismo_sm/routers/fluro_router.dart';

import '../../../models/lugar_model.dart';

class DetalleLugaresMobile extends StatelessWidget {
  final LugarModel lugar;

  const DetalleLugaresMobile({super.key, required this.lugar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Añadido GestureDetector alrededor de la imagen del logo
            GestureDetector(
              onTap: () {
                // Usando Fluro para navegar al home
                Flurorouter.router
                    .navigateTo(context, '/inicio', replace: true);
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
          ],
        ),
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                lugar.nombreLugar,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    lugar.imagenPrincipal,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lugar.nombreLugar,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        lugar.subtituloLugar,
                        style: const TextStyle(
                          fontSize: 8.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        lugar.detalleLugar,
                        style: const TextStyle(fontSize: 8.0),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Ubicación: ${lugar.ubicacionLugar}",
                        style: const TextStyle(fontSize: 8.0),
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
                      /*if (lugar.imagenSecundaria.isNotEmpty)
                        Image.network(
                          lugar.imagenSecundaria,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
