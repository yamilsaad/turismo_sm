import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:turismo_sm/core/helpers/screen_helper.dart';

class FraseView extends StatefulWidget {
  const FraseView({super.key});

  @override
  State<FraseView> createState() => _FraseViewState();
}

class _FraseViewState extends State<FraseView> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final _screeHeight = ScreenHelper.height(context);
    final _screeWidth = ScreenHelper.width(context);

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
                    width: ScreenHelper.containerWidth(context, 0.75),
                    child: Text(
                        '"Descubrí la magia de San Martín, donde cada rincón cuenta una historia y cada atardecer te dejará sin aliento."',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: "Poppins",
                          fontSize: ScreenHelper.fontSize(context, 0.03, min: 16, max: 36),
                        )),
                  )),
                )
              : Container(),
        ));
  }
}
