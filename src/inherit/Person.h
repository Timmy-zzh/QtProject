#pragma once

#include <QObject>
#include <QString>
#include <QtQml/qqmlregistration.h>

/**
 * 用户类
 * - 用户封装了姓名和年龄属性，提供给qml界面使用
 * - 作为数据的模型类
 */
class Person : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int age READ age WRITE setAge NOTIFY ageChanged)

public:
    explicit Person(QObject *parent = nullptr);
    ~Person();

    QString name() const;
    void setName(const QString &name);

    int age() const;
    void setAge(int age);

signals:
    void nameChanged(const QString &name); // 姓名变化时发出信号
    void ageChanged(int age);              // 年龄变化时发出信号

private:
    QString m_name; // 姓名
    int m_age;      // 年龄
};
