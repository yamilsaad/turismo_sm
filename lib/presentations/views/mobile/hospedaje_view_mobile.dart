/*import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:turismo_sm/configs/routers/app_route.dart';
import '../../../core/helpers/screen_helper.dart';

class HospedajeViewMobile extends StatelessWidget {
  const HospedajeViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      color: theme.scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppbarHospedajeWidget(),
          SizedBox(height: ScreenHelper.containerHeight(context, 0.01)),
          FutureBuilder(
            future: FirebaseFirestore.instance.collection('hospedajes').get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(
                    child: Text('Error al cargar los hospedajes.'));
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                    child: Text('No hay hospedajes disponibles.'));
              }

              final hospedajes = snapshot.data!.docs;

              return CarouselSlider.builder(
                options: CarouselOptions(
                  height: ScreenHelper.containerHeight(context, 0.5),
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: true,
                ),
                itemCount: hospedajes.length,
                itemBuilder: (context, index, realIndex) {
                  final data = hospedajes[index].data() as Map<String, dynamic>;
                  return _HospedajeCard(
                    nombre: data['nombre_hospedaje'] ?? '',
                    detalle: data['detalle_hospedaje'] ?? '',
                    imagen: data['imagen_principal'] ?? '',
                    onTap: () {
                      Get.toNamed(
                          '/detalle-hospedajeMobile/${hospedajes[index].id}');
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _HospedajeCard extends StatelessWidget {
  final String nombre;
  final String detalle;
  final String imagen;
  final VoidCallback onTap;

  const _HospedajeCard({
    required this.nombre,
    required this.detalle,
    required this.imagen,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            children: [
              Image.network(
                imagen,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      nombre,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: ScreenHelper.fontSize(context, 0.045, min: 16, max: 22),
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      detalle.length > 50
                          ? '${detalle.substring(0, 50)}...'
                          : detalle,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: ScreenHelper.fontSize(context, 0.03, min: 12, max: 16),
                        color: theme.colorScheme.onPrimary.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppbarHospedajeWidget extends StatelessWidget {
  const AppbarHospedajeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FadeIn(
      duration: const Duration(milliseconds: 2500),
      child: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          height: ScreenHelper.containerHeight(context, 0.08),
          width: ScreenHelper.containerWidth(context, 0.8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Conocé tu lugar en San Martín:',
                    style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.onPrimary,
                        fontSize: ScreenHelper.fontSize(context, 0.04)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sé parte de la historia de nuestra tierra',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: theme.colorScheme.onPrimary,
                        fontSize: ScreenHelper.fontSize(context, 0.02)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
