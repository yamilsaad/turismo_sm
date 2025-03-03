import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turismo_sm/routers/app_route.dart';
import '../../../controllers/lugar_controller.dart';

class LugaresMobileWidget extends StatelessWidget {
  const LugaresMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LugarController lugarController = Get.find<LugarController>();

    return Obx(() {
      if (lugarController.isLoading.value) {
        return const Center(
            child: SizedBox(
                height: 3, width: 3, child: CircularProgressIndicator()));
      } else if (lugarController.lugares.isEmpty) {
        return const Center(child: Text('No hay información disponible.'));
      } else if (lugarController.lugares.length < 3) {
        return const Center(
            child: Text('No hay suficientes lugares para mostrar.'));
      } else {
        final lugares = lugarController.lugares.sublist(0, 3);

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: lugares.map((lugar) {
                return _buildCategoryContainer(
                  context,
                  lugar.nombreLugar,
                  lugar.subtituloLugar,
                  lugar.imagenPrincipal,
                  () {
                    Get.toNamed('/detalle-lugarMobile/${lugar.idLugar}');
                  },
                );
              }).toList(),
            ),
          ),
        );
      }
    });
  }

  Widget _buildCategoryContainer(BuildContext context, String title,
      String subtituloLugar, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ZoomHoverContainer(
            title: title,
            subtituloLugar: subtituloLugar,
            imagePath: imagePath,
            child: Card(
              elevation: 5.0,
              child: Container(
                margin: const EdgeInsets.only(left: 2, right: 2),
                height: 75,
                width: 180,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ZoomHoverContainer extends StatelessWidget {
  final Widget child;
  final String title;
  final String subtituloLugar;
  final String imagePath;

  const ZoomHoverContainer({
    Key? key,
    required this.child,
    required this.title,
    required this.subtituloLugar,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Imagen con filtro oscuro
        Container(
          margin: const EdgeInsets.symmetric(vertical: 1.0),
          height: 75,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1.0),
            child: Stack(
              children: [
                Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 75,
                  width: 180,
                ),
                Container(
                  height: 75,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Texto del lugar
        Center(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 1.0),
                Text(
                  subtituloLugar,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 4.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
