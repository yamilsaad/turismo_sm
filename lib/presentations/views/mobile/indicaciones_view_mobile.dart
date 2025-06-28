import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/helpers/screen_helper.dart';

class IndicacionesViewMobile extends StatefulWidget {
  const IndicacionesViewMobile({super.key});

  @override
  _IndicacionesViewMobileState createState() => _IndicacionesViewMobileState();
}

class _IndicacionesViewMobileState extends State<IndicacionesViewMobile>
    with TickerProviderStateMixin {
  final MapController _mapController = MapController();
  double _zoomLevel = 10.0;
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
    final theme = Theme.of(context);
    final screenHeight = ScreenHelper.height(context);
    final screenWidth = ScreenHelper.width(context);

    final sanMartin = LatLng(-31.516389, -68.353611);
    final sanJuan = LatLng(-31.5333, -68.5196);

    final Distance distance = Distance();
    final double km = distance.as(LengthUnit.Kilometer, sanJuan, sanMartin);

    final midPoint = LatLng(
      (sanJuan.latitude + sanMartin.latitude) / 2,
      (sanJuan.longitude + sanMartin.longitude) / 2,
    );

    return SizedBox(
      height: ScreenHelper.containerHeight(context, 0.7),
      width: screenWidth,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: ScreenHelper.containerHeight(context, 0.3),
                width: screenWidth,
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: sanMartin,
                    initialZoom: _zoomLevel,
                    interactionOptions: InteractionOptions(
                      flags: _isInteractive ? InteractiveFlag.all : InteractiveFlag.none,
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
                          color: theme.colorScheme.primary,
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
                            color: theme.colorScheme.error,
                            size: ScreenHelper.fontSize(context, 0.05),
                          ),
                        ),
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: sanJuan,
                          child: Icon(
                            FontAwesomeIcons.houseChimney,
                            color: theme.colorScheme.primary,
                            size: ScreenHelper.fontSize(context, 0.05),
                          ),
                        ),
                        Marker(
                          width: ScreenHelper.containerWidth(context, 0.2),
                          height: ScreenHelper.containerHeight(context, 0.07),
                          point: midPoint,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "${km.toStringAsFixed(1)} km",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                  fontSize:
                                      ScreenHelper.fontSize(context, 0.04),
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
                    SizedBox(
                        height: ScreenHelper.containerHeight(context, 0.05)),
                    Text(
                      'Opciones de transporte:',
                      style: theme.textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: ScreenHelper.containerHeight(context, 0.05)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _buildTransportOption(
                              FontAwesomeIcons.car,
                              'Auto',
                              'Ruta 40 - 30 min desde San Juan',
                              theme.colorScheme.primary,
                              theme),
                        ),
                        Expanded(
                          child: _buildTransportOption(
                              FontAwesomeIcons.bus,
                              'Bus',
                              'Salidas diarias desde la terminal',
                              theme.colorScheme.primary,
                              theme),
                        ),
                        Expanded(
                          child: _buildTransportOption(
                              FontAwesomeIcons.plane,
                              'Avión',
                              'Aeropuerto de San Juan + Taxi',
                              theme.colorScheme.primary,
                              theme),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: ScreenHelper.containerHeight(context, 0.42),
            right: ScreenHelper.containerWidth(context, 0.08),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 36),
                    _mapArrowButton(Icons.keyboard_arrow_up, () {
                      final center = _mapController.camera.center;
                      _animatedMove(LatLng(center.latitude + 0.05, center.longitude), _mapController.camera.zoom);
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _mapArrowButton(Icons.keyboard_arrow_left, () {
                      final center = _mapController.camera.center;
                      _animatedMove(LatLng(center.latitude, center.longitude - 0.05), _mapController.camera.zoom);
                    }),
                    SizedBox(width: 8),
                    _mapArrowButton(Icons.keyboard_arrow_down, () {
                      final center = _mapController.camera.center;
                      _animatedMove(LatLng(center.latitude - 0.05, center.longitude), _mapController.camera.zoom);
                    }),
                    SizedBox(width: 8),
                    _mapArrowButton(Icons.keyboard_arrow_right, () {
                      final center = _mapController.camera.center;
                      _animatedMove(LatLng(center.latitude, center.longitude + 0.05), _mapController.camera.zoom);
                    }),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _mapZoomButton(FontAwesomeIcons.magnifyingGlassPlus, _zoomIn),
                    SizedBox(width: 8),
                    _mapZoomButton(FontAwesomeIcons.magnifyingGlassMinus, _zoomOut),
                  ],
                ),
                const SizedBox(height: 8),
                _mapToggleButton(
                  _isInteractive ? Icons.touch_app : Icons.touch_app_outlined,
                  _toggleInteraction,
                  _isInteractive,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransportOption(IconData icon, String title, String subtitle,
      Color color, ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: ScreenHelper.fontSize(context, 0.08)),
        const SizedBox(height: 8),
        Text(title,
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
        Text(
          subtitle,
          style: theme.textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
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

  Widget _mapToggleButton(IconData icon, VoidCallback onPressed, bool isActive) {
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
