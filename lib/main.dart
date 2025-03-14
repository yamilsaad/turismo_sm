import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turismo_sm/firebase_options.dart';
import 'package:turismo_sm/routers/app_route.dart';

import 'controllers/controller.dart';
import 'providers/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Asegura que los widgets estén inicializados antes de inicializar Firebase
  await AppState
      .initializeDefault(); // Espera a que se inicialice Firebase antes de ejecutar runApp()
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  static Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // ignore: avoid_print
    print('Initialized default app $app');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageProvider()),
        //ChangeNotifierProvider(create: (_) => DiseniosProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Get.put(BannerController()); // Inicializa el BannerController
    Get.put(LugarController()); // Inicializa el LugarController
    Get.put(HospedajeController()); //Inicializa el HospedajeController
    Get.put(SearchController()); //Inicializa el HospedajeController
    Get.put(MapaController()); //Inicializa controlador de mapa
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turismo San Martin',
      initialRoute: '/',
      theme: ThemeData(
          fontFamily: "Poppins",
          useMaterial3: true,
          colorSchemeSeed: Colors.green[700]),
      getPages: AppRouter.routes,
    );
  }
}
