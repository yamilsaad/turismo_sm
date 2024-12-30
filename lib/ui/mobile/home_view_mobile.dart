import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turismo_sm/ui/mobile/component/button_mobile_component.dart';

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
              child: Container(
                  margin: const EdgeInsets.only(bottom: 5.0),
                  color: Colors.transparent,
                  width: screenWidth *
                      0.13, // Ajuste relativo al ancho de la pantalla
                  height: screenHeight *
                      0.016, // Ajuste relativo al alto de la pantalla
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.orange),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Cómo llegar',
                        style: TextStyle(
                            fontSize: screenWidth * 0.01,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ))),
            ),
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
    return Obx(() {
      if (bannerController.isLoading.value) {
        return const Center(
            child: SizedBox(
                height: 10,
                width: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  backgroundColor: Colors.orange,
                  color: Colors.green,
                )));
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
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(banner.imagenBanner),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 5.0,
                    ),
                    child: Text(
                      banner.detalleBanner,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 3.9,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: const Offset(
                                0.5, 0.5), // Desplazamiento de la sombra
                            blurRadius: 1.0, // Radio de desenfoque
                            color: Colors.black87, // Color de la sombra
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
