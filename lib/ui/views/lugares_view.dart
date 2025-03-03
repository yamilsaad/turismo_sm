import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'widgets/widget.dart';

class LugaresView extends StatelessWidget {
  const LugaresView({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: _screenHeight,
      width: _screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppbarLugaresWidget(),
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FadeIn(
                  duration: const Duration(milliseconds: 1000),
                  child: const LugaresGridWidget())),
          /*FadeIn(
              duration: Duration(milliseconds: 1000),
              child: const ElegantAdornedWidget())*/
        ],
      ),
    );
  }
}

class AppbarLugaresWidget extends StatefulWidget {
  const AppbarLugaresWidget({
    super.key,
  });

  @override
  State<AppbarLugaresWidget> createState() => _AppbarLugaresWidgetState();
}

class _AppbarLugaresWidgetState extends State<AppbarLugaresWidget> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return VisibilityDetector(
      key: Key('lugares_desktop'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: _isVisible
          ? Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                //color: Colors.amber,
                height: _screenHeight * 0.12,
                width: _screenWidth * 0.5,
                child: FadeIn(
                  duration: Duration(milliseconds: 1200),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Conoce tu lugar en San Martín:',
                            style: TextStyle(
                                fontSize: _screenWidth * 0.02,
                                fontWeight: FontWeight.w500),
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
                            style: TextStyle(
                                fontSize: _screenWidth * 0.015,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF5F6F52)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              height: _screenHeight * 0.075,
              width: _screenWidth * 0.075,
            ),
    );
  }
}
