package com.saulo.nossograndedia

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin

/**
 * Widget grande: 💍 Nosso Grande Dia / Saulo ❤️ Ana / X dias / 09/09/2026.
 * Os dados exibidos são gravados pelo app Flutter via HomeWidget.saveWidgetData.
 */
class WeddingWidgetLargeProvider : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        val prefs = HomeWidgetPlugin.getData(context)
        val status = prefs.getString("status_texto", "Faltam alguns dias") ?: "Faltam alguns dias"
        val dataTexto = prefs.getString("data_texto", "09/09/2026") ?: "09/09/2026"

        for (widgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.widget_large)
            views.setTextViewText(R.id.widget_large_status, status)
            views.setTextViewText(R.id.widget_large_date, dataTexto)
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
