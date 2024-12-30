import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turismo_sm/routers/fluro_router.dart';
import '../../../controllers/lugar_controller.dart';
import '../screens/detalle_lugar_screen.dart';

class LugaresGridWidget extends StatelessWidget {
  const LugaresGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LugarController lugarController = Get.find<LugarController>();

    return Obx(() {
      if (lugarController.isLoading.value) {
        return const Center(
            child: SizedBox(
                height: 10, width: 10, child: CircularProgressIndicator()));
      } else if (lugarController.lugares.isEmpty) {
        return const Center(child: Text('No hay información disponible.'));
      } else if (lugarController.lugares.length < 3) {
        return const Center(
            child: Text('No hay suficientes lugares para mostrar.'));
      } else {
        final lugares = lugarController.lugares.sublist(0, 3);

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: lugares.map((lugar) {
              return _buildCategoryContainer(
                context,
                lugar.nombreLugar,
                lugar.subtituloLugar,
                lugar.imagenPrincipal,
                () {
                  Flurorouter.router.navigateTo(
                    context,
                    '/detalle-lugar/${lugar.idLugar}',
                  );
                },
              );
            }).toList(),
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
                margin: const EdgeInsets.only(left: 5, right: 5),
                height: 60, // Tamaño ajustable
                width: 75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ZoomHoverContainer extends StatefulWidget {
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
  _ZoomHoverContainerState createState() => _ZoomHoverContainerState();
}

class _ZoomHoverContainerState extends State<ZoomHoverContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            height: 60,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              boxShadow: [
                if (_isHovered)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2.0),
              child: AnimatedScale(
                scale: _isHovered ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Image.network(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (_isHovered)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              height: 60,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Colors.black.withOpacity(0.5),
              ),
              child: FadeIn(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 1.0),
                        Text(
                          widget.subtituloLugar,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 2.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
