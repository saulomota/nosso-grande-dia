/// Constantes centrais do app "Nosso Grande Dia".
/// Alterar aqui os dados do casal e a data do casamento.
class AppConstants {
  AppConstants._();

  /// Nomes do casal exibidos na tela principal.
  static const String noivo = 'Saulo';
  static const String noiva = 'Ana Lúcia';

  /// Data e hora do casamento (ano, mês, dia, hora, minuto).
  static final DateTime dataCasamento = DateTime(2026, 9, 9, 16, 0);

  /// Versículo exibido na tela principal.
  static const String versiculo =
      'Assim, eles já não são dois, mas uma só carne.';
  static const String referenciaVersiculo = 'Mateus 19:6';

  /// Identificadores usados para comunicação com o widget nativo Android.
  static const String widgetProviderSmall =
      'WeddingWidgetSmallProvider';
  static const String widgetProviderLarge =
      'WeddingWidgetLargeProvider';

  static const String prefDiasKey = 'dias';
  static const String prefStatusKey = 'status_texto';
  static const String prefTituloKey = 'titulo_widget';
  static const String prefDataKey = 'data_texto';
}
