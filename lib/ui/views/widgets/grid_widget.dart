import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/lugar_controller.dart';

class LugaresGridWidget extends StatelessWidget {
  const LugaresGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    final LugarController lugarController = Get.find<LugarController>();

    return Obx(() {
      if (lugarController.isLoading.value) {
        return Center(
            child: SizedBox(
                height: _screenHeight * 0.15,
                width: _screenWidth * 0.15,
                child: CircularProgressIndicator()));
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
                  Get.toNamed('/detalle-lugar',
                      arguments: lugar); // Navegar con GetX
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
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
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
                height: _screenHeight * 0.06, // Tamaño ajustable
                width: _screenWidth * 0.075,
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
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
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
            height: _screenHeight * 0.55,
            width: _screenWidth * 0.3,
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
              borderRadius: BorderRadius.circular(10.0),
              child: AnimatedScale(
                scale: _isHovered ? 1.1 : 1.0,
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
              height: _screenHeight * 0.55,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _screenWidth * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: _screenWidth * 0.01),
                        Text(
                          widget.subtituloLugar,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: _screenWidth * 0.02,
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
