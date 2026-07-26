import '../core/constants/app_constants.dart';
import '../models/countdown_data.dart';

/// Calcula a diferença entre "agora" e a data do casamento.
class CountdownService {
  const CountdownService();

  CountdownData calcular(DateTime agora) {
    final alvo = AppConstants.dataCasamento;
    final jaCasados = !agora.isBefore(alvo);

    final diferenca = jaCasados ? agora.difference(alvo) : alvo.difference(agora);

    final dias = diferenca.inDays;
    final horas = diferenca.inHours.remainder(24);
    final minutos = diferenca.inMinutes.remainder(60);
    final segundos = diferenca.inSeconds.remainder(60);

    return CountdownData(
      jaCasados: jaCasados,
      dias: dias,
      horas: horas,
      minutos: minutos,
      segundos: segundos,
    );
  }
}
