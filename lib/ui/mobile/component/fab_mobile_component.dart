import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controllers/controller.dart';

class FabMobileComponent extends StatelessWidget {
  final WhatsAppController controller = Get.put(WhatsAppController());

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return FloatingActionButton(
      onPressed: controller.openWhatsApp,
      backgroundColor: Color(0xff25D366),
      child: FaIcon(
        FontAwesomeIcons.whatsapp,
        size: _screenWidth * 0.075,
        color: Colors.white,
      ),
    );
  }
}
