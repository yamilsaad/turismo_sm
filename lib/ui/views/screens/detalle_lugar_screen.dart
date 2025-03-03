import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turismo_sm/models/lugar_model.dart';

class DetalleLugarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    // Obtener el lugar desde los argumentos
    final LugarModel lugar = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false, // Oculta la flecha de regreso
        elevation: 0.0,
        toolbarHeight: _screenHeight * 0.11,
        title: GestureDetector(
          onTap: () {
            Get.toNamed('/'); // Navega a la página de inicio
          },
          child: SizedBox(
            height: _screenHeight * 0.2,
            width: _screenWidth * 0.45,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/img/logo_turismo2.webp',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mostrar imagen principal del lugar
            Image.network(lugar.imagenPrincipal),
            const SizedBox(height: 16.0),
            // Mostrar el nombre y subtítulo del lugar
            Text(
              lugar.nombreLugar,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              lugar.subtituloLugar,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            // Mostrar los detalles del lugar
            Text(
              'Detalle:',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(lugar.detalleLugar),
            const SizedBox(height: 16.0),
            // Mostrar ubicación y fechas
            Text(
              'Ubicación: ${lugar.ubicacionLugar}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Creado el: ${lugar.fechaCreacion}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Última actualización: ${lugar.fechaActualizacion}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
