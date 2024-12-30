import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismo_sm/providers/pages_provider.dart';

import 'custom_mobile_item.dart';

class CustomMobileMenu extends StatefulWidget {
  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomMobileMenu>
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
            color: Colors.black,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: isOpen ? 100 : 45,
          height: isOpen ? 280 : 45,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMobileItem(
                    delay: 0,
                    text: 'Inicio',
                    onPressed: () => pageProvider.goTo(0)),
                CustomMobileItem(
                    delay: 30,
                    text: 'Lugares',
                    onPressed: () => pageProvider.goTo(1)),
                CustomMobileItem(
                    delay: 60,
                    text: 'Hospedaje',
                    onPressed: () => pageProvider.goTo(2)),
                CustomMobileItem(
                    delay: 90,
                    text: 'Experimenta',
                    onPressed: () => pageProvider.goTo(3)),
                CustomMobileItem(
                    delay: 120,
                    text: 'Contacto',
                    onPressed: () => pageProvider.goTo(4)),
                /*CustomMobileItem(
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
      width: 45,
      height: 45,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          AnimatedIcon(
            semanticLabel: 'Menu',
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
