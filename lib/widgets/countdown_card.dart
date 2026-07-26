import 'dart:ui';

import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

/// Um único bloco da contagem (ex: "12" / "Dias"), com moldura dourada
/// discreta, usado para montar a linha Dias / Horas / Minutos / Segundos.
class CountdownCard extends StatelessWidget {
  final int valor;
  final String rotulo;

  const CountdownCard({
    super.key,
    required this.valor,
    required this.rotulo,
  });

  String get _valorFormatado => valor.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 68,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.navyCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.gold.withOpacity(0.35),
              width: 1,
            ),
          ),
          child: Text(
            _valorFormatado,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.goldLight,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFeatures: [FontFeature.tabularFigures()],
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          rotulo.toUpperCase(),
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 11,
            letterSpacing: 1.4,
          ),
        ),
      ],
    );
  }
}
