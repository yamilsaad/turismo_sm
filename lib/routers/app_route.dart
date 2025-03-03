import 'package:get/get.dart';
import 'package:turismo_sm/ui/pages/home_page.dart';

import '../controllers/controller.dart';
import '../ui/views/screens/screen.dart';

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
      ];
}
