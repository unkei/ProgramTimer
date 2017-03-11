#include <QGuiApplication>
#include <QQmlApplicationEngine>

#if defined(Q_OS_IOS)
#include "iosidletimer.h"
#endif

int main(int argc, char *argv[])
{
#if defined(Q_OS_IOS)
    IosIdleTimer idleTimer;
    idleTimer.setTimerDisabled();
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
