import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FraseView extends StatefulWidget {
  const FraseView({super.key});

  @override
  State<FraseView> createState() => _FraseViewState();
}

class _FraseViewState extends State<FraseView> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final _screeHeight = MediaQuery.of(context).size.height;
    final _screeWidth = MediaQuery.of(context).size.width;

    return SizedBox(
        height: _screeHeight,
        width: _screeWidth,
        child: VisibilityDetector(
          key: Key('frase'),
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
                          fontSize: _screeWidth * 0.03,
                        )),
                  )),
                )
              : Container(),
        ));
  }
}
