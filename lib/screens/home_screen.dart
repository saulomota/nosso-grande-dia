import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';
import '../models/countdown_data.dart';
import '../services/countdown_service.dart';
import '../services/widget_service.dart';
import '../widgets/countdown_card.dart';
import '../widgets/elegant_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _countdownService = const CountdownService();
  final _widgetService = const WidgetService();

  late CountdownData _data;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _data = _countdownService.calcular(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
    // Atualiza o widget da tela inicial assim que o app abre.
    _widgetService.atualizarWidget(_data);
  }

  void _tick() {
    final novaData = _countdownService.calcular(DateTime.now());
    setState(() => _data = novaData);

    // Evita chamadas excessivas à plataforma: só sincroniza o widget
    // uma vez por minuto (quando os segundos zeram).
    if (novaData.segundos == 0) {
      _widgetService.atualizarWidget(novaData);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataFormatada =
        DateFormat("dd 'de' MMMM 'de' yyyy", 'pt_BR').format(
      AppConstants.dataCasamento,
    );

    return Scaffold(
      backgroundColor: AppColors.navy,
      body: ElegantBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            '❤️ ${AppConstants.noivo} & ${AppConstants.noiva} ❤️',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: AppTheme.fontDisplay,
                              color: AppColors.textPrimary,
                              fontSize: 20,
                              letterSpacing: 0.6,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'NOSSO GRANDE DIA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.fontDisplay,
                              color: AppColors.gold,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.4,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: 64,
                            height: 2,
                            color: AppColors.gold.withOpacity(0.6),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            _data.textoStatus,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.goldLight,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _data.jaCasados
                                ? 'Desde $dataFormatada'
                                : dataFormatada,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 28),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CountdownCard(valor: _data.dias, rotulo: 'Dias'),
                              const SizedBox(width: 12),
                              CountdownCard(valor: _data.horas, rotulo: 'Horas'),
                              const SizedBox(width: 12),
                              CountdownCard(
                                  valor: _data.minutos, rotulo: 'Minutos'),
                              const SizedBox(width: 12),
                              CountdownCard(
                                  valor: _data.segundos, rotulo: 'Segundos'),
                            ],
                          ),
                          const SizedBox(height: 44),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                Text(
                                  '"${AppConstants.versiculo}"',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: AppTheme.fontDisplay,
                                    color: AppColors.textPrimary,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  AppConstants.referenciaVersiculo,
                                  style: const TextStyle(
                                    color: AppColors.gold,
                                    fontSize: 12,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
