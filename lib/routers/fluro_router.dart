import 'package:fluro/fluro.dart';
import 'package:turismo_sm/routers/router_handler.dart';
import 'package:turismo_sm/ui/mobile/screens/detalle_hospedaje_mobile.dart';

import '../ui/views/screens/detalle_hospedaje_screen.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static void configureRoutes() {
    // Rutas principales
    router.define('/:page', handler: homeHandler);

    // Ruta para detalle de lugares
    router.define('/detalle-lugar/:id', handler: detalleLugarHandler);
    // Ruta para detalle de lugares
    router.define('/detalle-lugarMobile/:id',
        handler: detalleLugarMobileHandler);

    // Ruta para detalle de hospedajes
    router.define(
      '/detalle-hospedaje/:id',
      handler: Handler(
        handlerFunc: (context, parameters) {
          final hospedajeId = parameters['id']?.first;
          if (hospedajeId != null) {
            return DetalleHospedajeScreen(hospedajeId: hospedajeId);
          }
          return null;
        },
      ),
    );

    router.define(
      '/detalle-hospedajeMobile/:id',
      handler: Handler(
        handlerFunc: (context, parameters) {
          final hospedajeId = parameters['id']?.first;
          if (hospedajeId != null) {
            return DetalleHospedajeMobile(hospedajeId: hospedajeId);
          }
          return null;
        },
      ),
    );

    // 404
    router.notFoundHandler = homeHandler;
  }
}
