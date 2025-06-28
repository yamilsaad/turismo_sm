import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:turismo_sm/presentations/views/mobile/widgets/lugares_mobile_widget.dart';
import '../../../core/helpers/screen_helper.dart';

class LugaresViewMobile extends StatelessWidget {
  const LugaresViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FittedBox(
      fit: BoxFit.contain,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppbarLugaresWidget(),
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FadeIn(
                  duration: const Duration(milliseconds: 1000),
                  child: const LugaresMobileWidget())),
          Divider(
            height: ScreenHelper.containerHeight(context, 0.02),
            color: theme.colorScheme.onBackground,
          ),
        ],
      ),
    );
  }
}

class AppbarLugaresWidget extends StatelessWidget {
  const AppbarLugaresWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FadeIn(
      duration: const Duration(milliseconds: 2500),
      child: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          height: ScreenHelper.containerHeight(context, 0.04),
          width: ScreenHelper.containerWidth(context, 0.5),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Conoce tu lugar en San Martín:',
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenHelper.fontSize(context, 0.03)),
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
                    style: theme.textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: const Color(0XFF5F6F52),
                        fontSize: ScreenHelper.fontSize(context, 0.015)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
