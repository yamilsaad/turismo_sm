import 'package:flutter/material.dart';

import '../../../models/lugar_model.dart';

class DetalleLugarScreen extends StatelessWidget {
  final LugarModel lugar;

  const DetalleLugarScreen({super.key, required this.lugar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset('assets/img/logo_turismo2.webp')),
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lugar.nombreLugar,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        lugar.subtituloLugar,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        lugar.detalleLugar,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        "Ubicación: ${lugar.ubicacionLugar}",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 16.0),
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
