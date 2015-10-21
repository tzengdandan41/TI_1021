#include <QGuiApplication>
#include <QtQuick/QQuickView>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include "demofunction.h"
int main(int argc, char *argv[])
{
   /* QGuiApplication app(argc, argv);

    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/main.qml"));

    view.show();*/

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    DemoFunction demo;
    engine.rootContext()->setContextProperty("DemoClass", &demo);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
   // engine.load(QUrl(QStringLiteral("qrc:/main_otherTest.qml")));

    return app.exec();
}
