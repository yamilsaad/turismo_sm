import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FraseViewMobile extends StatefulWidget {
  const FraseViewMobile({super.key});

  @override
  State<FraseViewMobile> createState() => _FraseViewMobileState();
}

class _FraseViewMobileState extends State<FraseViewMobile> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final _screeHeight = MediaQuery.of(context).size.height;
    final _screeWidth = MediaQuery.of(context).size.width;

    return SizedBox(
        height: _screeHeight * 0.5,
        width: _screeWidth,
        child: VisibilityDetector(
          key: Key('frase_mobile'),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.2) {
              setState(() {
                _isVisible = true;
              });
            }
          },
          child: _isVisible
              ? FadeIn(
                  duration: Duration(milliseconds: 1300),
                  child: Center(
                      child: SizedBox(
                    width: _screeWidth * 0.75,
                    child: Text(
                        '"Descubrí la magia de San Martín, donde cada rincón cuenta una historia y cada atardecer te dejará sin aliento."',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: "Poppins",
                          fontSize: _screeWidth * 0.05,
                        )),
                  )),
                )
              : Container(),
        ));
  }
}
