#pragma once

#include <QObject>
#include <QString>
#include <QList>
#include <QVariant>
// #include "src/inherit/Person.h"
#include <QtQml/qqmlregistration.h>

/**
 * 模拟数据模型
 * - 模拟从数据库中，获取Person列表数据
 * - 获取到数据，两种方式，交给qml界面进行展示
 * -- 一直是通过信号函数，将数据以参数方法传递给qml界面
 * -- 一种是发送通知信号，让qml通过cpp类获取数据
 * - 属性还是使用Q_PROPERTY暴露给qml
 * - 方法也是使用Q_INVOKABLE暴露给qml
 * - 要替代 qmlRegisterType方法，得定义 QML_ELEMENT宏，让qt自动去完成注册
 */
class DataViewModel : public QObject
{
    Q_OBJECT
    // Q_PROPERTY(QList<Person *> personList READ personList NOTIFY personListChanged)
    QML_ELEMENT

public:
    explicit DataViewModel(QObject *parent = nullptr);
    ~DataViewModel();

    // 模拟从数据库中获取数据 - 暴露给qml使用
    Q_INVOKABLE void fetchData();

    // 获取数据列表
    // QList<QVariant> getDataList() const;

    // 获取Person对象列表
    // Q_INVOKABLE QList<Person *> getPersonList() const;

    // 通过属性暴露Person列表
    // QList<Person *> personList() const { return m_personList; }

signals:
    // void dataChanged(const QList<QVariant> &dataList); // 数据变化时发出信号
    void strDataChanged(const QString &strData); // 字符串数据变化时发出信号
    // void personListChanged();                          // Person列表变化时发出信号

private:
    // QList<QVariant> m_dataList; // 存储数据列表，使用QVariant以支持多种类型
    QString m_strData;          // 字符串数据
    // QList<Person *> m_personList; // 存储Person对象列表
};
