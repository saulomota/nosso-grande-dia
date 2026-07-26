package com.saulo.nossograndedia

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin

/**
 * Widget pequeno ("Nosso Dia"): 💍 / Nosso Dia / X dias.
 * Os dados exibidos são gravados pelo app Flutter via HomeWidget.saveWidgetData.
 */
class WeddingWidgetSmallProvider : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        val prefs = HomeWidgetPlugin.getData(context)
        val dias = prefs.getInt("dias", 0)

        for (widgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.widget_small)
            views.setTextViewText(R.id.widget_small_days, "$dias dias")
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
