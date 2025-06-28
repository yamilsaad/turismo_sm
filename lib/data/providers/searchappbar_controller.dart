/*import 'package:get/get.dart';

class SearchappbarController extends GetxController {
  var searchQuery = ''.obs;
  var searchResults = <String>[].obs;

  // Simulación de títulos y palabras clave del sitio web
  final List<String> allItems = [
    "Hospedaje en San Juan",
    "Los mejores lugares turísticos",
    "Actividades al aire libre",
    "Gastronomía en la ciudad",
    "Historia y cultura",
    "Eventos imperdibles",
    "Excursiones y aventuras",
    "Vida nocturna en San Juan",
    "Dónde comer en la ciudad",
    "Rutas de senderismo"
  ];

  void search(String query) {
    searchQuery.value = query.toLowerCase();
    searchResults.value = allItems
        .where((item) => item.toLowerCase().contains(searchQuery.value))
        .toList();
  }
}*/

import 'package:get/get.dart';

class SearchappbarController extends GetxController {
  var searchQuery = ''.obs;
  var searchResults = <Map<String, String>>[].obs;

  // Lista con título y ruta asociada
  final List<Map<String, String>> allItems = [
    {
      "title": "Hospedaje en San Juan",
      "route": "http://localhost:58605/#/detalle-hospedaje/9POlfV1RBxb7VSELEjgL"
    },
    {"title": "Los mejores lugares turísticos", "route": "/lugares-turisticos"},
    {"title": "Actividades al aire libre", "route": "/actividades"},
    {"title": "Gastronomía en la ciudad", "route": "/gastronomia"},
    {"title": "Historia y cultura", "route": "/historia"},
    {"title": "Eventos imperdibles", "route": "/eventos"},
    {"title": "Excursiones y aventuras", "route": "/excursiones"},
    {"title": "Vida nocturna en San Juan", "route": "/vida-nocturna"},
    {"title": "Dónde comer en la ciudad", "route": "/donde-comer"},
    {"title": "Rutas de senderismo", "route": "/senderismo"},
  ];

  void search(String query) {
    searchQuery.value = query.toLowerCase();
    searchResults.value = allItems
        .where(
            (item) => item["title"]!.toLowerCase().contains(searchQuery.value))
        .toList();
  }
}
