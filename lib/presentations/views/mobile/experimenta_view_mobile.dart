import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:turismo_sm/presentations/views/mobile/components/button_mobile_component.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/helpers/screen_helper.dart';

class ExperimentaViewMobile extends StatefulWidget {
  const ExperimentaViewMobile({super.key});

  @override
  State<ExperimentaViewMobile> createState() => _ExperimentaViewMobileState();
}

class _ExperimentaViewMobileState extends State<ExperimentaViewMobile> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = ScreenHelper.width(context);
    final screenHeight = ScreenHelper.height(context);
    final isMobile = screenWidth < 600;

    return Container(
      color: theme.scaffoldBackgroundColor,
      width: screenWidth,
      height: screenHeight,
      child: VisibilityDetector(
        key: Key('experiencia_mobile'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.2) {
            setState(() {
              _isVisible = true;
            });
          }
        },
        child: _isVisible
            ? SizedBox(
                child: Stack(
                  children: [
                    FadeIn(
                      duration: const Duration(milliseconds: 1000),
                      child: Image.asset(
                        'assets/img/experimenta_fondo.webp',
                        width: screenWidth,
                        height: screenHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: ScreenHelper.containerWidth(context, 0.1),
                      top: ScreenHelper.containerHeight(context, 0.3),
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: ScreenHelper.containerWidth(context, 0.02)),
                        child: FadeIn(
                          duration: const Duration(milliseconds: 1200),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                  height: ScreenHelper.containerHeight(
                                      context, 0.02)),
                              ..._buildTextLines(context, isMobile, theme),
                              SizedBox(
                                  height: ScreenHelper.containerHeight(
                                      context, 0.02)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: ScreenHelper.containerHeight(context, 0.8),
                      left: ScreenHelper.containerWidth(context, 0.5),
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 2000),
                        child: Container(
                          color: Colors.transparent,
                          width: ScreenHelper.containerWidth(context, 0.4),
                          height: ScreenHelper.containerHeight(context, 0.06),
                          child: const ButtonMobileComponent(),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }

  List<Widget> _buildTextLines(
      BuildContext context, bool isMobile, ThemeData theme) {
    final screenWidth = ScreenHelper.width(context);
    final textLines = [
      '¡Vive experiencias únicas!',
      'Conéctate con la naturaleza',
      'Descubre la calidez de sus habitantes',
      'Disfruta de la mejor gastronomía local',
      '¡Vení a vivir San Martín!',
    ];

    return textLines.map((line) {
      return FadeIn(
        duration: const Duration(milliseconds: 1200),
        child: SizedBox(
          width: ScreenHelper.containerWidth(context, 0.6),
          child: Text(
            line,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontSize: isMobile
                  ? ScreenHelper.fontSize(context, 0.06)
                  : ScreenHelper.fontSize(context, 0.04),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      );
    }).toList();
  }
}
