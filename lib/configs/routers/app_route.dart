import 'package:get/get.dart';
import 'package:turismo_sm/data/providers/banner_controller.dart';
import 'package:turismo_sm/presentations/pages/home_page.dart';
import 'package:turismo_sm/presentations/views/web/screens/detalle_lugar_screen.dart';
import 'package:turismo_sm/presentations/views/mobile/screens/working_screen_mobile.dart';
import 'package:turismo_sm/presentations/views/web/screens/working_screen_web.dart';

class AppRouter {
  static List<GetPage> get routes => [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<BannerController>(() => BannerController());
          }),
        ),
        GetPage(
            name: '/detalle-lugar',
            page: () => DetalleLugarScreen()), // Ruta de detalle del lugar
        //GetPage(name: '/detalle_hospedaje', page: () => const FormMobileScreen()),
        //GetPage(name: '/empresa_mobile', page: () => const EmpresaScreen()),
        GetPage(
          name: '/working-mobile',
          page: () => const WorkingScreenMobile(),
        ),
        GetPage(
          name: '/working-web',
          page: () => const WorkingScreenWeb(),
        ),
      ];
}
