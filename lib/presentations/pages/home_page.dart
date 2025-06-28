import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:turismo_sm/presentations/views/mobile/components/fab_mobile_component.dart';
import 'package:turismo_sm/presentations/views/mobile/view_mobile.dart';
import 'package:turismo_sm/presentations/views/web/components/fab_desktop_component.dart';
import '../views/mobile/widgets/mobile_widget.dart';
import '../views/web/views.dart';
import '../views/web/widgets/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffEAFAEA),
          scrolledUnderElevation: 0.0,
          automaticallyImplyLeading: false, // Oculta la flecha de regreso
          elevation: 0.0,
          toolbarHeight: screenHeight * 0.11,
          title: GestureDetector(
            onTap: () {
              Get.toNamed('/'); // Navega a la página de inicio
            },
            child: SizedBox(
              height: screenHeight * 0.11,
              width: screenWidth * 1.5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/logo_turismo2.webp',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: screenWidth * 0.015,
                  ),
                  Text(
                    'San Martín Turismo',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: screenWidth > 600
                          ? screenWidth * 0.02 // Desktop
                          : screenWidth * 0.055, // Mobile
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        endDrawer: MediaQuery.of(context).size.width > 600
            ? DrawerWidget(screenWidth: screenWidth) // Versión para escritorio
            : DrawerMobileWidget(
                screenWidth: screenWidth), // Versión para móvil

        floatingActionButton: MediaQuery.of(context).size.width > 600
            ? FabDesktopComponent() // FAB para escritorio
            : FabMobileComponent(), // FAB para móvil

        body: LayoutBuilder(builder: (context, contraints) {
          if (contraints.maxWidth > 650) {
            return const _DesktopView();
          } else {
            return const _MobileView();
          }
        }));
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          HomeView(),
          IndicacionesView(),
          //LugaresView(),
          //HospedajesView(),
          //SeleccionDestinoView(),
          FraseView(),
          ExperimentaView(),
          ContactoView(),
        ],
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          HomeViewMobile(),
          IndicacionesViewMobile(),
          //LugaresViewMobile(),
          //HospedajeViewMobile(),
          //SeleccionDestinoView(),
          FraseViewMobile(),
          ExperimentaViewMobile(),
          ContactoViewMobile(),
        ],
      ),
    );
  }
}
