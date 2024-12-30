import 'package:fluro/fluro.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turismo_sm/models/lugar_model.dart';
import 'package:turismo_sm/ui/mobile/screens/detalle_lugares_mobile.dart';
import 'package:turismo_sm/ui/pages/home_page.dart';
import 'package:turismo_sm/ui/views/screens/detalle_lugar_screen.dart';

import '../controllers/controller.dart';
import '../providers/provider.dart';

final homeHandler = Handler(handlerFunc: (context, params) {
  final page = params['page']!.first;
  if (page != '/') {
    final pageProvider = Provider.of<PageProvider>(context!, listen: false);
    pageProvider.createScrollController(page);

    return const HomePage();
  }
  return null;
});

final detalleLugarHandler = Handler(handlerFunc: (context, params) {
  final idLugar = params['id']?.first ?? '';

  // Obtener la información del lugar desde el controlador
  final lugarController = Get.find<LugarController>();
  final lugar = lugarController.lugares.firstWhere(
    (lugar) => lugar.idLugar == idLugar,
    orElse: () => throw Exception("Lugar no encontrado"),
  );

  // Mostrar la pantalla de detalle
  return DetalleLugarScreen(lugar: lugar);
});

final detalleLugarMobileHandler = Handler(handlerFunc: (context, params) {
  final idLugar = params['id']?.first ?? '';

  // Obtener la información del lugar desde el controlador
  final lugarController = Get.find<LugarController>();
  final lugar = lugarController.lugares.firstWhere(
    (lugar) => lugar.idLugar == idLugar,
    orElse: () => throw Exception("Lugar no encontrado"),
  );

  // Mostrar la pantalla de detalle
  return DetalleLugaresMobile(lugar: lugar);
});
