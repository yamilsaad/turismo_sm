import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turismo_sm/ui/mobile/widget/empresas_widget.dart';
import 'package:turismo_sm/ui/mobile/widget/guias_widget.dart';

import '../../controllers/controller.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final BannerController bannerController =
        Get.put(BannerController()); // Inicializa el controlador
    bannerController
        .fetchBanners(); // Llamar al método para obtener los banners

    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ImagenFondoHome(),
          SizedBox(height: screenHeight * 0.01),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GuiasWidget(),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5.0, bottom: 5, right: 10, left: 10),
            child: EmpresasWidget(),
          ),
          SizedBox(height: screenHeight * 0.009),
          FadeInUp(
            duration: const Duration(milliseconds: 2000),
            child: SizedBox(
              width: screenWidth * 0.75,
              height: screenHeight * 0.06,
              child: FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: () {},
                child: Text(
                  'Cómo llegar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (screenWidth * 0.1).clamp(14.0, 18.0),
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }
}

class ImagenFondoHome extends StatefulWidget {
  const ImagenFondoHome({super.key});

  @override
  _ImagenFondoHomeState createState() => _ImagenFondoHomeState();
}

class _ImagenFondoHomeState extends State<ImagenFondoHome> {
  late Timer _timer;
  final BannerController bannerController = Get.find<BannerController>();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      bannerController.updateCurrentBannerIndex();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeigth = MediaQuery.of(context).size.height;

    return Obx(() {
      if (bannerController.isLoading.value) {
        return Center(
          child: SizedBox(
            width: 22,
            height: 22,
            child: Image.asset('assets/img/logo_carga.gif'),
          ),
        );
      } else if (bannerController.banners.isNotEmpty) {
        final banner =
            bannerController.banners[bannerController.currentIndex.value];

        return Container(
          key: ValueKey<String>(banner.imagenBanner),
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(banner.imagenBanner),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: ClipRRect(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: _screenWidth * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 5.0,
                    ),
                    child: Text(
                      banner.detalleBanner,
                      style: TextStyle(
                        color: const Color(0XFF5F6F52),
                        fontSize: (_screenWidth * 0.2).clamp(12.0, 16.0),
                        fontWeight: FontWeight.bold,
                        shadows: const [
                          Shadow(
                            offset: Offset(0.2, 0.2),
                            blurRadius: 1.0,
                            color: Colors.black87,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return const Center(child: Text('No hay banners disponibles'));
      }
    });
  }
}


/*import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controller.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final BannerController bannerController =
        Get.put(BannerController()); // Inicializa el controlador
    bannerController
        .fetchBanners(); // Llamar al método para obtener los banners

    return Container(
      color: Colors.white,
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //NavBarWidget(),
            const ImagenFondoHome(),
            FadeInUp(
              duration: const Duration(milliseconds: 2000),
              child: SizedBox(
                  width: screenWidth *
                      0.09, // Ajuste relativo al ancho de la pantalla
                  height: screenHeight *
                      0.010, // Ajuste relativo al alto de la pantalla
                  child: FloatingActionButton(
                      backgroundColor: Colors.orange,
                      onPressed: () {},
                      child: Text(
                        'Cómo llegar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: screenWidth * 0.009,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ))),
            ),
            SizedBox(
              height: 5.0,
            )
          ],
        ),
      ),
    );
  }
}

class ImagenFondoHome extends StatefulWidget {
  const ImagenFondoHome({super.key});

  @override
  _ImagenFondoHomeState createState() => _ImagenFondoHomeState();
}

class _ImagenFondoHomeState extends State<ImagenFondoHome> {
  late Timer _timer;
  final BannerController bannerController = Get.find<BannerController>();

  @override
  void initState() {
    super.initState();
    // Cambiar el índice del banner automáticamente cada 5 segundos
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      bannerController.updateCurrentBannerIndex();
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancelar el temporizador al salir
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      if (bannerController.isLoading.value) {
        return Center(
            child: SizedBox(
                width: 22,
                height: 22,
                child: Image.asset('assets/img/logo_carga.gif'))
            /*Container(
            margin: const EdgeInsets.only(top: 1.0),
            //color: Colors.green,
            height: 1.5, // Altura del contenedor
            width: 1.5, // Ancho del contenedor
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              strokeWidth: 0.25, // Grosor del borde
              color: Colors.green, // Color principal
              backgroundColor: Colors.orange,
            ),
          ),*/
            );
      } else if (bannerController.banners.isNotEmpty) {
        final banner = bannerController
            .banners[bannerController.currentIndex.value]; // Banner actual

        return AnimatedSwitcher(
          duration: const Duration(seconds: 3), // Duración de la transición
          switchInCurve: Curves.easeInOut, // Suavidad al entrar
          switchOutCurve: Curves.easeInOut, // Suavidad al salir
          child: Container(
            key: ValueKey<String>(
                banner.imagenBanner), // Clave única para el banner
            height: 75,
            width: 60,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(banner.imagenBanner),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: screenWidth * 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.5),
                      child: Text(
                        banner.detalleBanner,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              screenWidth * 0.007, // Tamaño dinámico del texto
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            Shadow(
                              offset: Offset(0.2, 0.2),
                              blurRadius: 1.0,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return const Center(child: Text('No hay banners disponibles'));
      }
    });
  }
}
*/