import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismo_sm/providers/pages_provider.dart';
import 'package:turismo_sm/ui/shared/custom_item_menu.dart';

class CustomAppMenu extends StatefulWidget {
  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0XFF5F6F52),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 370 : 50,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMenuItem(
                    delay: 0,
                    text: 'inicio',
                    onPressed: () => pageProvider.goTo(0)),
                CustomMenuItem(
                    delay: 30,
                    text: 'explora',
                    onPressed: () => pageProvider.goTo(1)),
                CustomMenuItem(
                    delay: 60,
                    text: 'alojamiento',
                    onPressed: () => pageProvider.goTo(2)),
                CustomMenuItem(
                    delay: 90,
                    text: 'Mapa',
                    onPressed: () => pageProvider.goTo(3)),
                CustomMenuItem(
                    delay: 120,
                    text: 'Experimenta',
                    onPressed: () => pageProvider.goTo(4)),
                CustomMenuItem(
                    delay: 150,
                    text: 'Contacto',
                    onPressed: () => pageProvider.goTo(5)),
                /*CustomMenuItem(
                    delay: 150,
                    text: 'Contact',
                    onPressed: () => pageProvider.goTo(5)),*/
                SizedBox(height: 8)
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      width: 100,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 20 : 0,
          ),
          Text('menu',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
