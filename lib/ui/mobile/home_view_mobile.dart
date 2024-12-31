import 'dart:async';

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
              child: Container(
                  margin: const EdgeInsets.only(bottom: 5.0),
                  //color: Colors.transparent,
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
          child: Container(
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
          ),
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
            width: 85,
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
                    //color: Colors.yellow,
                    width: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
