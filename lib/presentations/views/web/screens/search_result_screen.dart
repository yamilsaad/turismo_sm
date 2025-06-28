import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turismo_sm/data/providers/searchappbar_controller.dart';
import 'package:url_launcher/url_launcher.dart';

/*class SearchResultsScreen extends StatelessWidget {
  final SearchappbarController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultados de búsqueda")),
      body: Obx(() {
        if (searchController.searchResults.isEmpty) {
          return const Center(
            child: Text(
              "No se encontraron resultados.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: searchController.searchResults.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(searchController.searchResults[index]),
              onTap: () {
                // Aquí puedes redirigir a la página del resultado
              },
            );
          },
        );
      }),
    );
  }
}*/

// ignore: use_key_in_widget_constructors
class SearchResultsScreen extends StatelessWidget {
  final SearchappbarController searchController = Get.find();

  void launchUrl(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw "No se pudo abrir el enlace: $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultados de búsqueda")),
      body: Obx(() {
        if (searchController.searchResults.isEmpty) {
          return const Center(
            child: Text(
              "No se encontraron resultados.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: searchController.searchResults.length,
          itemBuilder: (context, index) {
            var item = searchController.searchResults[index];
            return ListTile(
              title: Text(item["title"]!),
              onTap: () {
                String route = item["route"]!;
                if (route.startsWith("http")) {
                  // Abrir en el navegador si es un enlace web
                  launchUrl(route);
                } else {
                  // Navegar a la pantalla correspondiente
                  Get.toNamed(route);
                }
              },
            );
          },
        );
      }),
    );
  }
}
