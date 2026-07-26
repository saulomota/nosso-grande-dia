import 'package:flutter/material.dart';

/// Paleta e tema visual "elegante" do app: fundo escuro (preto/azul-marinho)
/// com detalhes em dourado.
class AppColors {
  AppColors._();

  static const Color navy = Color(0xFF0A0E17);
  static const Color navyDeep = Color(0xFF050810);
  static const Color navyCard = Color(0xFF121826);
  static const Color gold = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFF1D98B);
  static const Color goldMuted = Color(0xFFA9862F);
  static const Color textPrimary = Color(0xFFF5F1E6);
  static const Color textSecondary = Color(0xFFB8BCC8);
}

class AppTheme {
  AppTheme._();

  static const String fontDisplay = 'serif';

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.navy,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.gold,
        secondary: AppColors.goldLight,
        surface: AppColors.navyCard,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: fontDisplay,
          color: AppColors.gold,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
        titleLarge: TextStyle(
          fontFamily: fontDisplay,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
      ),
    );
  }
}
