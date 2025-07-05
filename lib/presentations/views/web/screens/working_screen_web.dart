import 'package:flutter/material.dart';
import 'package:turismo_sm/core/helpers/screen_helper.dart';

class WorkingScreenWeb extends StatelessWidget {
  const WorkingScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/logo_turismo2.webp',
                width: ScreenHelper.width(context) * 0.18,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),
              Text(
                'Estamos Trabajando en Algo Increíble',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Esta página estará disponible pronto.',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
