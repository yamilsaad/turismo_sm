import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turismo_sm/ui/views/components/button_reserva_component.dart';

import '../../controllers/controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NavBarWidget(),
            const ImagenFondoHome(),
            FadeInUp(
              duration: const Duration(milliseconds: 2000),
              child: Container(
                margin: const EdgeInsets.only(bottom: 5.0),
                color: Colors.transparent,
                width: 400,
                height: 20,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonReservaComponent(),
                  ],
                ),
              ),
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
        return const Center(child: CircularProgressIndicator());
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
            height: 150,
            width: 400,
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
                      horizontal: 10.0,
                    ),
                    child: Text(
                      banner.detalleBanner,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: const Offset(
                                1.2, 1.2), // Desplazamiento de la sombra
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


/*import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:turismo_sm/ui/views/components/button_reserva_component.dart';

import 'widgets/widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: double.infinity,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //NavBarWidget(),
              ImagenFondoHome(),
              FadeInUp(
                duration: Duration(milliseconds: 2000),
                child: Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  color: Colors.transparent,
                  width: 400,
                  height: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonReservaComponent(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class ImagenFondoHome extends StatelessWidget {
  const ImagenFondoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 2000),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        height: 150,
        width: 400,
        child: Image.asset(
          'assets/img/fondo_home.webp',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
*/