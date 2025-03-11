import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IndicacionesViewMobile extends StatefulWidget {
  const IndicacionesViewMobile({super.key});

  @override
  _IndicacionesViewMobileState createState() => _IndicacionesViewMobileState();
}

class _IndicacionesViewMobileState extends State<IndicacionesViewMobile>
    with TickerProviderStateMixin {
  final MapController _mapController = MapController();
  double _zoomLevel = 10.0;

  void _animatedMove(LatLng destLocation, double destZoom) {
    final _latTween = Tween<double>(
        begin: _mapController.camera.center.latitude,
        end: destLocation.latitude);
    final _lngTween = Tween<double>(
        begin: _mapController.camera.center.longitude,
        end: destLocation.longitude);
    final _zoomTween =
        Tween<double>(begin: _mapController.camera.zoom, end: destZoom);

    final controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.addListener(() {
      _mapController.move(
        LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
        _zoomTween.evaluate(animation),
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  void _zoomIn() {
    _animatedMove(_mapController.camera.center, _mapController.camera.zoom + 1);
  }

  void _zoomOut() {
    _animatedMove(_mapController.camera.center, _mapController.camera.zoom - 1);
  }

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;

    final sanMartin = LatLng(-31.516389, -68.353611);
    final sanJuan = LatLng(-31.5333, -68.5196);

    // 📌 Calculamos la distancia
    final Distance distance = Distance();
    final double km = distance.as(LengthUnit.Kilometer, sanJuan, sanMartin);

    // 📌 Punto medio de la línea
    final midPoint = LatLng(
      (sanJuan.latitude + sanMartin.latitude) / 2,
      (sanJuan.longitude + sanMartin.longitude) / 2,
    );

    return SizedBox(
      height: _screenHeight * 0.7,
      width: _screenWidth,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: _screenHeight * 0.3,
                width: _screenWidth,
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: sanMartin,
                    initialZoom: _zoomLevel,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: [sanJuan, sanMartin],
                          color: Colors.orange,
                          strokeWidth: 2.5,
                        ),
                      ],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: sanMartin,
                          child: Icon(
                            FontAwesomeIcons.houseChimney,
                            color: Colors.red,
                            size: _screenWidth * 0.05,
                          ),
                        ),
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: sanJuan,
                          child: Icon(
                            FontAwesomeIcons.houseChimney,
                            color: Colors.blue,
                            size: _screenWidth * 0.05,
                          ),
                        ),
                        // 📍 Distancia en KM sobre la línea
                        Marker(
                          width: _screenWidth * 0.2,
                          height: _screenHeight * 0.07,
                          point: midPoint,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "${km.toStringAsFixed(1)} km",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _screenWidth * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: _screenHeight * 0.05),
                    Text(
                      'Opciones de transporte:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: _screenHeight * 0.05),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildTransportOption(FontAwesomeIcons.car, 'Auto',
                              'Ruta 40 - 30 min desde San Juan', Colors.orange),
                          _buildTransportOption(
                              FontAwesomeIcons.bus,
                              'Bus',
                              'Salidas diarias desde la terminal',
                              Colors.orange),
                          _buildTransportOption(FontAwesomeIcons.plane, 'Avión',
                              'Aeropuerto de San Juan + Taxi', Colors.orange),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: _screenHeight * 0.42,
            right: _screenWidth * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "zoom_in",
                  onPressed: _zoomIn,
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlassPlus,
                  ),
                ),
                SizedBox(width: _screenWidth * 0.05),
                FloatingActionButton(
                  heroTag: "zoom_out",
                  onPressed: _zoomOut,
                  child: Icon(FontAwesomeIcons.magnifyingGlassMinus),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransportOption(
      IconData icon, String title, String subtitle, Color colorIcon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: Colors.green[700]),
        SizedBox(height: 5),
        SizedBox(
            width: 100,
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold))),
        SizedBox(height: 5),
        SizedBox(
          width: 100,
          child: Text(subtitle,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }
}
