import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';

import '../core/constants/app_constants.dart';
import '../models/countdown_data.dart';

/// Responsável por enviar os dados atuais da contagem para o widget
/// nativo Android (App Widget) e disparar a sua atualização.
class WidgetService {
  const WidgetService();

  Future<void> atualizarWidget(CountdownData data) async {
    final dataFormatada = DateFormat('dd/MM/yyyy').format(
      AppConstants.dataCasamento,
    );

    await HomeWidget.saveWidgetData<int>(AppConstants.prefDiasKey, data.dias);
    await HomeWidget.saveWidgetData<String>(
      AppConstants.prefStatusKey,
      data.textoStatus,
    );
    await HomeWidget.saveWidgetData<String>(
      AppConstants.prefTituloKey,
      'Nosso Grande Dia',
    );
    await HomeWidget.saveWidgetData<String>(
      AppConstants.prefDataKey,
      dataFormatada,
    );

    await HomeWidget.updateWidget(
      androidName: AppConstants.widgetProviderSmall,
    );
    await HomeWidget.updateWidget(
      androidName: AppConstants.widgetProviderLarge,
    );
  }
}
