import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Color(0xffEAFAEA),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0))),
      width: screenWidth * 0.5,
      child: Column(
        children: [
          Container(
            height: _screenHeight * 0.2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10.0),
              ),
              child: FadeInImage(
                placeholder: const AssetImage('assets/img/logo_turismo2.webp'),
                image: AssetImage('assets/img/logo_turismo2.webp'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
              width: _screenWidth * 0.5,
              child: Center(
                  child: Text(
                'San Martín Turismo',
                style: TextStyle(
                    fontFamily: "Poppins", fontSize: _screenWidth * 0.025),
              ))),
          Divider(
            height: _screenHeight * 0.02,
          ),
          ListTile(
            hoverColor: Colors.amber,
            onTap: () {},
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.image,
                  size: _screenWidth * 0.025,
                ),
                SizedBox(width: _screenWidth * 0.01),
                Text(
                  'Galería',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: _screenWidth * 0.02),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: _screenWidth * 0.02,
            ),
          ),
          ListTile(
            hoverColor: Colors.amber,
            onTap: () {},
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.heart,
                  size: _screenWidth * 0.02,
                ),
                SizedBox(width: _screenWidth * 0.01),
                Text(
                  'Nuestras Fiestas',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: _screenWidth * 0.02),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: _screenWidth * 0.02,
            ),
          ),
          ListTile(
            hoverColor: Colors.amber,
            onTap: () {},
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.comment,
                  size: _screenWidth * 0.02,
                ),
                SizedBox(width: _screenWidth * 0.01),
                Text(
                  'Contacto',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: _screenWidth * 0.02),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: _screenWidth * 0.02,
            ),
          ),
          Divider(
            height: _screenHeight * 0.02,
          ),
        ],
      ),
    );
  }
}
