import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

/// Fundo escuro em degradê (preto -> azul-marinho) com um brilho dourado
/// sutil ao centro, usado como base da tela principal.
class ElegantBackground extends StatelessWidget {
  final Widget child;

  const ElegantBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.navyDeep, AppColors.navy],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -80,
            left: -60,
            child: _glow(220),
          ),
          Positioned(
            bottom: -100,
            right: -60,
            child: _glow(260),
          ),
          child,
        ],
      ),
    );
  }

  Widget _glow(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            AppColors.gold.withOpacity(0.08),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
