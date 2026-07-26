/// Representa o estado atual da contagem em relação ao casamento.
class CountdownData {
  final bool jaCasados;
  final int dias;
  final int horas;
  final int minutos;
  final int segundos;

  const CountdownData({
    required this.jaCasados,
    required this.dias,
    required this.horas,
    required this.minutos,
    required this.segundos,
  });

  /// Texto principal: "Faltam X dias" ou "Casados há X dias".
  String get textoStatus {
    if (jaCasados) {
      return dias == 1 ? 'Casados há 1 dia' : 'Casados há $dias dias';
    }
    return dias == 1 ? 'Falta 1 dia' : 'Faltam $dias dias';
  }
}
