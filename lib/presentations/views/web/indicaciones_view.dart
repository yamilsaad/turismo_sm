import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turismo_sm/core/helpers/screen_helper.dart';

class IndicacionesView extends StatefulWidget {
  const IndicacionesView({super.key});

  @override
  _IndicacionesViewState createState() => _IndicacionesViewState();
}

class _IndicacionesViewState extends State<IndicacionesView>
    with TickerProviderStateMixin {
  final MapController _mapController = MapController();
  double _zoomLevel = 11.0;
  bool _isInteractive = false;

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

  void _toggleInteraction() {
    setState(() {
      _isInteractive = !_isInteractive;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _screenHeight = ScreenHelper.height(context);
    final _screenWidth = ScreenHelper.width(context);

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
      height: ScreenHelper.containerHeight(context, 0.75),
      width: _screenWidth,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: ScreenHelper.containerHeight(context, 0.4),
                width: _screenWidth,
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: sanMartin,
                    initialZoom: _zoomLevel,
                    interactionOptions: InteractionOptions(
                      flags: _isInteractive
                          ? InteractiveFlag.all
                          : InteractiveFlag.none,
                    ),
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
                            size: 40.0,
                          ),
                        ),
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: sanJuan,
                          child: Icon(
                            FontAwesomeIcons.houseChimney,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                        ),
                        // 📍 Distancia en KM sobre la línea
                        Marker(
                          width: ScreenHelper.containerWidth(context, 0.065),
                          height: ScreenHelper.containerHeight(context, 0.06),
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
                                  fontSize: ScreenHelper.fontSize(
                                      context, 0.012,
                                      min: 10, max: 20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: ScreenHelper.containerHeight(context, 0.05)),
                    Text(
                      'Opciones de transporte:',
                      style: TextStyle(
                          fontSize: ScreenHelper.fontSize(context, 0.018,
                              min: 16, max: 24),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: ScreenHelper.containerHeight(context, 0.05)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTransportOption(FontAwesomeIcons.car, 'Auto',
                            'Ruta 40 - 30 min desde San Juan', Colors.orange),
                        _buildTransportOption(FontAwesomeIcons.bus, 'Bus',
                            'Salidas diarias desde la terminal', Colors.orange),
                        _buildTransportOption(FontAwesomeIcons.plane, 'Avión',
                            'Aeropuerto de San Juan + Taxi', Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: ScreenHelper.containerHeight(context, 0.4),
            right: ScreenHelper.containerWidth(context, 0.18),
            child: Column(
              children: [
                // Cruz de desplazamiento
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 36), // Espacio para centrar la flecha arriba
                    _mapArrowButton(Icons.keyboard_arrow_up, () {
                      final center = _mapController.camera.center;
                      _animatedMove(
                          LatLng(center.latitude + 0.05, center.longitude),
                          _mapController.camera.zoom);
                    }),
                    const SizedBox(width: 8),
                    // Botón toggle de interacción
                    _mapToggleButton(
                      _isInteractive
                          ? Icons.touch_app
                          : Icons.touch_app_outlined,
                      _toggleInteraction,
                      _isInteractive,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _mapArrowButton(Icons.keyboard_arrow_left, () {
                      final center = _mapController.camera.center;
                      _animatedMove(
                          LatLng(center.latitude, center.longitude - 0.05),
                          _mapController.camera.zoom);
                    }),
                    SizedBox(width: 8),
                    _mapArrowButton(Icons.keyboard_arrow_down, () {
                      final center = _mapController.camera.center;
                      _animatedMove(
                          LatLng(center.latitude - 0.05, center.longitude),
                          _mapController.camera.zoom);
                    }),
                    SizedBox(width: 8),
                    _mapArrowButton(Icons.keyboard_arrow_right, () {
                      final center = _mapController.camera.center;
                      _animatedMove(
                          LatLng(center.latitude, center.longitude + 0.05),
                          _mapController.camera.zoom);
                    }),
                  ],
                ),
                const SizedBox(height: 8),
                // Botones de zoom
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _mapZoomButton(
                        FontAwesomeIcons.magnifyingGlassPlus, _zoomIn),
                    SizedBox(width: 8),
                    _mapZoomButton(
                        FontAwesomeIcons.magnifyingGlassMinus, _zoomOut),
                  ],
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
      children: [
        Icon(icon, size: 40, color: Colors.green[700]),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 3),
        Text(subtitle,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _mapArrowButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 36,
      height: 36,
      child: FloatingActionButton(
        heroTag: icon.toString(),
        onPressed: onPressed,
        mini: true,
        child: Icon(icon, size: 20),
      ),
    );
  }

  Widget _mapZoomButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 36,
      height: 36,
      child: FloatingActionButton(
        heroTag: icon.toString(),
        onPressed: onPressed,
        mini: true,
        child: Icon(icon, size: 18),
      ),
    );
  }

  Widget _mapToggleButton(
      IconData icon, VoidCallback onPressed, bool isActive) {
    return SizedBox(
      width: 36,
      height: 36,
      child: FloatingActionButton(
        heroTag: icon.toString(),
        onPressed: onPressed,
        mini: true,
        backgroundColor: isActive ? Colors.green : Colors.grey,
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );
  }
}
