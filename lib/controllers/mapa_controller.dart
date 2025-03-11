import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MapaController extends GetxController {
  void abrirMapa(String destino) async {
    String url =
        "https://www.google.com/maps/dir/current+location/${Uri.encodeComponent(destino)}";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "No se pudo abrir el mapa.");
    }
  }
}
