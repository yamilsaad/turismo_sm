import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppController extends GetxController {
  final String phoneNumber =
      "+5492645748636"; // Número de WhatsApp en formato internacional

  void openWhatsApp() async {
    final Uri url = Uri.parse("https://wa.me/$phoneNumber");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "No se pudo abrir WhatsApp");
    }
  }
}
