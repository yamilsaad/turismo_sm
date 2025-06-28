import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/helpers/screen_helper.dart';

class ContactoViewMobile extends StatelessWidget {
  const ContactoViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = ScreenHelper.height(context);
    final screenWidth = ScreenHelper.width(context);

    return Container(
      height: ScreenHelper.containerHeight(context, 0.5),
      width: screenWidth,
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: ScreenHelper.containerHeight(context, 0.015)),
              Center(
                child: Text(
                  "San Martín Turismo",
                  style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontSize: ScreenHelper.fontSize(context, 0.065),
                      fontFamily: 'Poppins'),
                ),
              ),
              SizedBox(height: ScreenHelper.containerHeight(context, 0.01)),
              Center(
                child: SizedBox(
                  width: ScreenHelper.containerWidth(context, 0.75),
                  child: Text(
                    "Vive una experiencia única",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onBackground,
                        fontFamily: "Poppins"),
                  ),
                ),
              ),
              SizedBox(height: ScreenHelper.containerHeight(context, 0.015)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _footerLink("Institucional", theme, context),
                      _footerLink("Autoridades", theme, context),
                      _footerLink("Nuestro proveedor", theme, context),
                    ],
                  ),
                  SizedBox(
                    height: ScreenHelper.containerHeight(context, 0.025),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon(FontAwesomeIcons.facebook, theme),
                      SizedBox(
                        height: ScreenHelper.containerHeight(context, 0.03),
                      ),
                      _socialIcon(FontAwesomeIcons.xTwitter, theme),
                      SizedBox(
                        height: ScreenHelper.containerHeight(context, 0.03),
                      ),
                      _socialIcon(FontAwesomeIcons.linkedin, theme),
                      SizedBox(
                        height: ScreenHelper.containerHeight(context, 0.03),
                      ),
                      _socialIcon(FontAwesomeIcons.instagram, theme),
                    ],
                  ),
                ],
              ),
              Divider(
                height: ScreenHelper.containerHeight(context, 0.085),
                color: theme.colorScheme.onSurface,
              ),
              Center(
                child: SizedBox(
                  width: ScreenHelper.containerWidth(context, 0.9),
                  child: Text(
                    "© 2025 San Martín Turismo. Sitio web desarrollado por Soft Tech Solutions",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontSize: ScreenHelper.fontSize(context, 0.035)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String text, ThemeData theme, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontSize: ScreenHelper.fontSize(context, 0.04)),
      ),
    );
  }

  Widget _socialIcon(IconData icon, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Icon(icon, color: theme.colorScheme.onSurface, size: 22),
    );
  }
}
