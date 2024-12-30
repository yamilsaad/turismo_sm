import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class GastronomiaWidget extends StatelessWidget {
  const GastronomiaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.amber,
      width: 110,
      child: Column(
        children: [
          FadeIn(
            duration: const Duration(milliseconds: 2000),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCategoryContainer(
                    context, 'Hamburguesa', 'assets/img/grid_prueba.jpg'),
                const SizedBox(width: 2.0),
                _buildCategoryContainer(
                    context, 'Tito', 'assets/img/grid_prueba.jpg'),
                const SizedBox(width: 2.0),
                _buildCategoryContainer(
                    context, 'Yeyo', 'assets/img/grid_prueba.jpg'),
              ],
            ),
          ),
          const SizedBox(height: 2.0),
          FadeIn(
            duration: Duration(milliseconds: 2000),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCategoryContainer(
                    context, 'Panchos', 'assets/img/grid_prueba2.jpg'),
                const SizedBox(width: 2.0),
                _buildCategoryContainer(
                    context, 'Pachatas', 'assets/img/grid_prueba2.jpg'),
                const SizedBox(width: 2.0),
                _buildCategoryContainer(
                    context, 'Hotel', 'assets/img/grid_prueba2.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryContainer(
      BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Aquí puedes agregar la acción que deseas realizar al tocar el contenedor
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Seleccionaste $title')),
        );
      },
      child: Column(
        children: [
          ZoomHoverContainer(
            child: Container(
              height: 20,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            title,
            style: TextStyle(fontSize: 2, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ZoomHoverContainer extends StatefulWidget {
  final Widget child;

  const ZoomHoverContainer({Key? key, required this.child}) : super(key: key);

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
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: _isHovered ? 21 : 20, // Levemente más grande cuando hace zoom
        width: _isHovered ? 31 : 30,
        transform: Matrix4.identity()
          ..translate(-0.5, -0.5) // Centraliza el zoom
          ..scale(_isHovered ? 1.05 : 1.0), // Zoom menor
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.5),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                      color: Colors.white10, blurRadius: 2, spreadRadius: 1)
                ]
              : [], // Sombra para que no quede detrás
        ),
        child: AnimatedOpacity(
          opacity: _isHovered ? 0.7 : 1.0, // Efecto de opacidad
          duration: Duration(milliseconds: 200),
          child: widget.child,
        ),
      ),
    );
  }
}
