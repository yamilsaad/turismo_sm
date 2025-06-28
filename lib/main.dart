import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turismo_sm/configs/firebase_options.dart';
import 'package:turismo_sm/configs/routers/app_route.dart';
import 'package:turismo_sm/configs/themes/app_theme.dart';
import 'package:turismo_sm/configs/themes/theme_controller.dart';
import 'data/providers/controller.dart';

/// Punto de entrada principal de la aplicación Turismo San Martín.
/// Inicializa Firebase y los controladores principales con GetX.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppState.initializeDefault();
  runApp(const AppState());
}

/// Widget raíz de la aplicación. Se encarga de la inicialización global.
class AppState extends StatelessWidget {
  const AppState({super.key});

  /// Inicializa Firebase con las opciones por plataforma.
  static Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Initialized default app $app');
  }

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

/// Widget principal de la aplicación. Configura el tema y las rutas.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  void initState() {
    super.initState();
    // Inicialización de controladores globales con GetX
    Get.put(BannerController());
    Get.put(LugarController());
    Get.put(HospedajeController());
    Get.put(SearchController());
    Get.put(MapaController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Turismo San Martin',
          initialRoute: '/',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: _themeController.themeMode.value,
          getPages: AppRouter.routes,
        ));
  }
}
