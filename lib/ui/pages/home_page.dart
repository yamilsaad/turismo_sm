import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismo_sm/providers/pages_provider.dart';
import 'package:turismo_sm/ui/mobile/experimenta_view_mobile.dart';
import 'package:turismo_sm/ui/mobile/view_mobile.dart';
import 'package:turismo_sm/ui/pages/alert/alert_auth.dart';
import 'package:turismo_sm/ui/views/hospedaje_view.dart';

import '../views/views.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: SizedBox(
                height: 60,
                width: 60,
                child: Image.asset('assets/img/logo_turismo2.webp'),
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
                    // Lógica de búsqueda aquí
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
                      label: Text(
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
              shape: RoundedRectangleBorder(
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
                    decoration: BoxDecoration(
                      color: Color(0xff8FD14F),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.0),
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.asset('assets/img/logo_turismo2.webp'),
                          ),
                        ),
                        Center(
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
                  Center(child: const _NavButton(text: 'inicio', pageIndex: 0)),
                  Divider(height: 2.0),
                  Center(
                      child: const _NavButton(text: 'lugares', pageIndex: 1)),
                  Divider(height: 2.0),
                  Center(
                      child:
                          const _NavButton(text: 'alojamiento', pageIndex: 2)),
                  Divider(height: 2.0),
                  Center(
                      child:
                          const _NavButton(text: 'experimenta', pageIndex: 3)),
                  Divider(height: 2.0),
                  Center(
                      child: const _NavButton(text: 'contacto', pageIndex: 4)),
                  Divider(height: 2.0),
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
        ContactoView(),
      ],
    );
  }
}
