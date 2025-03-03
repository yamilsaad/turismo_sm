import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turismo_sm/ui/mobile/component/fab_mobile_component.dart';
import 'package:turismo_sm/ui/mobile/view_mobile.dart';
import 'package:turismo_sm/ui/views/components/fab_desktop_component.dart';
import '../mobile/widget/mobile_widget.dart';
import '../views/views.dart';
import '../views/widgets/widget.dart';

/*





class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.put(SearchappbarController());
    // Simula si el usuario está logueado o no
    bool isLoggedIn = false; // Cambia esto según el estado de tu app
    String? userPhotoUrl; // URL de la foto del usuario, si está logueado
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading:
            false, // Desactiva el botón de regreso automático
        leading: null, // No mostrar nada en la posición del leading
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                // Usando Fluro para navegar al home
                Flurorouter.router
                    .navigateTo(context, '/inicio', replace: true);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset('assets/img/logo_turismo2.webp'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "San Martín Turismo",
                style: TextStyle(
                  color: const Color(0xff8FD14F),
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth > 650 ? 24 : 18,
                ),
              ),
            ),
            if (screenWidth > 1000) ...[
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Buscar en el sitio web...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0xffD7E4C0),
                        width: 0.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 0.8,
                      ),
                    ),
                  ),
                  onSubmitted: (query) {
                    searchController.search(query);
                    Get.to(() => SearchResultsScreen());
                  },
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const _NavButton(text: 'inicio', pageIndex: 0),
              const _NavButton(text: 'lugares', pageIndex: 1),
              const _NavButton(text: 'alojamiento', pageIndex: 2),
              const _NavButton(text: 'experimenta', pageIndex: 3),
              const _NavButton(text: 'contacto', pageIndex: 4),
            ] else if (screenWidth > 600) ...[
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.grey),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: _SiteSearchDelegate(),
                  );
                },
              ),
            ],
            const SizedBox(width: 20),
            if (screenWidth > 650 && screenWidth > 1000)
              isLoggedIn
                  ? GestureDetector(
                      onTap: () {
                        showProfileDialog(context, userPhotoUrl);
                      },
                      child: CircleAvatar(
                        backgroundImage: userPhotoUrl != null
                            ? NetworkImage(userPhotoUrl)
                            : const AssetImage('assets/default_avatar.png')
                                as ImageProvider,
                      ),
                    )
                  : TextButton.icon(
                      icon: const Icon(
                        Icons.login,
                        color: Color(0XFF8FD14F),
                      ),
                      onPressed: () {
                        showLoginRegisterDialog(context);
                      },
                      label: const Text(
                        'ingresar',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                    ),
          ],
        ),
        elevation: 0,
      ),
      endDrawer: screenWidth <= 1000
          ? Drawer(
              width: 300,
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.zero, // Esto elimina las esquinas redondeadas
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Añadimos un botón para cerrar el Drawer
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.grey),
                        onPressed: () {
                          Navigator.of(context).pop(); // Esto cierra el Drawer
                        },
                      ),
                    ),
                  ),
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xff8FD14F),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.asset('assets/img/logo_turismo2.webp'),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'San Martín Turismo',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Center(child: _NavButton(text: 'inicio', pageIndex: 0)),
                  const Divider(height: 4.0),
                  const Center(
                      child: _NavButton(text: 'lugares', pageIndex: 1)),
                  const Divider(height: 4.0),
                  const Center(
                      child: _NavButton(text: 'alojamiento', pageIndex: 2)),
                  const Divider(height: 4.0),
                  const Center(
                      child: _NavButton(text: 'experimenta', pageIndex: 3)),
                  const Divider(height: 4.0),
                  const Center(
                      child: _NavButton(text: 'contacto', pageIndex: 4)),
                  const Divider(height: 4.0),
                ],
              ),
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 650) {
            return Container(
              decoration: buildBoxDecoration(),
              child: Stack(
                children: [
                  _HomeBody(),
                ],
              ),
            );
          } else {
            return Container(
              decoration: buildBoxDecoration(),
              child: Stack(
                children: [
                  _MobileBody(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration();
}

class _NavButton extends StatelessWidget {
  final String text;
  final int pageIndex;

  const _NavButton({required this.text, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        pageProvider.goTo(pageIndex);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0XFF5F6F52),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _SiteSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implementa el filtrado por palabras clave
    return Center(
      child: Text('Resultados para "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implementa sugerencias dinámicas basadas en el query
    return ListView.builder(
      itemCount: 5, // Número de sugerencias
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Sugerencia $index para "$query"'),
          onTap: () {
            query = 'Sugerencia $index';
            showResults(context);
          },
        );
      },
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        LugaresView(),
        HospedajesView(),
        //SeleccionDestinoView(),
        ExperimentaView(),
        ContactoView(),
      ],
    );
  }
}

class _MobileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: const [
        HomeViewMobile(),
        LugaresViewMobile(),
        HospedajeViewMobile(),
        //SeleccionDestinoView(),
        ExperimentaViewMobile(),
        ContactoViewMobile(),
      ],
    );
  }
}
*/

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
            return _DesktopView();
          } else {
            return _MobileView();
          }
        }));
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            HomeView(),
            //LugaresView(),
            //HospedajesView(),
            //SeleccionDestinoView(),
            //ExperimentaView(),
            ContactoView(),
          ],
        ),
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          HomeViewMobile(),
          //LugaresViewMobile(),
          //HospedajeViewMobile(),
          //SeleccionDestinoView(),
          //ExperimentaViewMobile(),
          ContactoViewMobile(),
        ],
      ),
    );
  }
}
