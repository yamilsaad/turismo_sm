import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/helpers/screen_helper.dart';

class FraseViewMobile extends StatefulWidget {
  const FraseViewMobile({super.key});

  @override
  State<FraseViewMobile> createState() => _FraseViewMobileState();
}

class _FraseViewMobileState extends State<FraseViewMobile> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = ScreenHelper.height(context);
    final screenWidth = ScreenHelper.width(context);

    return SizedBox(
        height: ScreenHelper.containerHeight(context, 0.5),
        width: screenWidth,
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
                  duration: const Duration(milliseconds: 1300),
                  child: Center(
                      child: SizedBox(
                    width: ScreenHelper.containerWidth(context, 0.75),
                    child: Text(
                        '"Descubrí la magia de San Martín, donde cada rincón cuenta una historia y cada atardecer te dejará sin aliento."',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontStyle: FontStyle.italic,
                          fontFamily: "Poppins",
                          fontSize: ScreenHelper.fontSize(context, 0.05),
                        )),
                  )),
                )
              : Container(),
        ));
  }
}
