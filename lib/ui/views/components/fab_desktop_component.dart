import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controllers/controller.dart';

class FabDesktopComponent extends StatelessWidget {
  final WhatsAppController controller = Get.put(WhatsAppController());

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return FloatingActionButton(
      backgroundColor: Color(0xff25D366),
      onPressed: controller.openWhatsApp,
      child: FaIcon(
        FontAwesomeIcons.whatsapp,
        size: _screenWidth * 0.03,
        color: Colors.white,
      ),
      //label: Text("Chat with us"),
      //backgroundColor: Colors.green,
    );
  }
}
