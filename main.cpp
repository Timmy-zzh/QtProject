#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/inherit/DataManager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // 注册C++类到QML
    // 参数：模板类，模块名，主版本号，次版本号，QML中的类型名
    // qmlRegisterType<DataManager>("com.timmy.qml", 1, 0, "DataManager");

    QQmlApplicationEngine engine;

    // 也可以做成全局变量
    // DataManager dataManager;
    // 将DataManager实例暴露给QML
    // engine.rootContext()->setContextProperty("dataManager", &dataManager);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []()
        { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    // engine.loadFromModule("QtProject", "Main");

    engine.load(QUrl(QStringLiteral("qrc:/qml/Window.qml")));

    return app.exec();
}
