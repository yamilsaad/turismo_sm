/*
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeleccionDestinoView extends StatefulWidget {
  const SeleccionDestinoView({super.key});

  @override
  _SeleccionDestinoViewState createState() => _SeleccionDestinoViewState();
}

class _SeleccionDestinoViewState extends State<SeleccionDestinoView> {
  String? _hoveredRegion;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffD5FFD0), Colors.white], // Colores del gradiente
          begin: Alignment.topCenter, // Punto de inicio del gradiente
          end: Alignment.bottomCenter, // Punto final del gradiente
        ),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      //color: Colors.amber,
                      width: 320,
                      height: 50,
                      child: Text(
                        'Encuentra tu destino',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      width: 180,
                      height: 30,
                      child: Text(
                        'Encuentra tu destino',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0XFF5F6F52),
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                FadeInDown(
                  curve: Curves.bounceOut,
                  duration: Duration(milliseconds: 3000),
                  child: Container(
                    //color: Colors.amber,
                    width: 700,
                    height: 500,
                    child: GestureDetector(
                      onTapUp: (details) {
                        final Offset position = details.localPosition;
                        _handleTapOnMap(context, position);
                      },
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/img/map_sm.svg',
                              fit: BoxFit.cover,
                              width: 800,
                              height: 700,
                            ),
                          ),
                          // Overlay highlight for RegionOne
                          if (_hoveredRegion == 'RegionOne')
                            Positioned(
                              left: 140,
                              top: 150,
                              width: 50,
                              height: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                          // Overlay highlight for RegionTwo
                          if (_hoveredRegion == 'RegionTwo')
                            Positioned(
                              left: 450,
                              top: 150,
                              width: 50,
                              height: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(100.0)),
                              ),
                            ),
                          // MouseRegion for RegionOne
                          Positioned(
                            left: 140,
                            top: 150,
                            width: 40,
                            height: 50,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              onEnter: (_) => _onHoverRegion('RegionOne'),
                              onExit: (_) => _onHoverRegion(null),
                            ),
                          ),
                          // MouseRegion for RegionTwo
                          Positioned(
                            left: 450,
                            top: 150,
                            width: 100,
                            height: 240,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              onEnter: (_) => _onHoverRegion('RegionTwo'),
                              onExit: (_) => _onHoverRegion(null),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleTapOnMap(BuildContext context, Offset position) {
    final regions = {
      'RegionOne': _isWithinRegionOne(position),
      'RegionTwo': _isWithinRegionTwo(position),
    };

    regions.forEach((regionName, isInRegion) {
      if (isInRegion) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _getRegionPage(regionName),
          ),
        );
      }
    });
  }

  bool _isWithinRegionOne(Offset position) {
    return position.dx > 100 &&
        position.dx < 200 &&
        position.dy > 150 &&
        position.dy < 290;
  }

  bool _isWithinRegionTwo(Offset position) {
    return position.dx > 450 &&
        position.dx < 500 &&
        position.dy > 50 &&
        position.dy < 290;
  }

  void _onHoverRegion(String? region) {
    setState(() {
      _hoveredRegion = region;
    });
  }

  Widget _getRegionPage(String regionName) {
    switch (regionName) {
      case 'RegionOne':
        return RegionOnePage();
      case 'RegionTwo':
        return RegionTwoPage();
      default:
        return Container();
    }
  }
}

class RegionOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Región 1')),
      body: Container(
        color: Colors.red,
        child: Center(child: Text('Detalles de la Región 1.')),
      ),
    );
  }
}

class RegionTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Región 2')),
      body: Container(
        color: Colors.blue,
        child: Center(child: Text('Detalles de la Región 2.')),
      ),
    );
  }
}
*/
