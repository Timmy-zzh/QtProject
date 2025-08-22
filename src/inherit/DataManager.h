#pragma once

#include <QObject>
#include <QDebug>
#include <QList>
#include <QString>
#include <QTimer>

/**
 * @brief DataManager
 * 数据管理类，负责管理和处理数据相关的操作
 * - 此类继承自 QObject，便于在 Qt 的信号和槽机制中使用
 * -- explicit 关键字用于防止隐式转换
 * - 定义属性,使用Q_PROPERTY 宏暴露给 QML
 * - 定义函数，使用 Q_INVOKABLE 宏暴露给 QML
 * - 使用信号和槽机制来处理数据变化和倒计时事件
 * 倒计时使用 QTimer 实现
 */
class DataManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString data READ data WRITE setData NOTIFY dataChanged)

public:
    explicit DataManager(QObject *parent = nullptr);
    ~DataManager();

    // 暴露qml可以访问的方法
    Q_INVOKABLE void operateData(const int &index);

    // 开始倒计时  不能用这个方法startCountDown
    Q_INVOKABLE void onStartCountdown();

    // 停止倒计时
    Q_INVOKABLE void onStopCountdown();

    // 获取数据
    QString data() const;
    void setData(const QString &data);

signals:                                             // 信号函数
    void dataChanged(const QString &data);           // 数据变化时发出信号
    void currTimerChanged(const QString &currTimer); // 当前计时器变化时发出信号
    void operateDataFinished(const QString &data);   // 数据操作完成时发出信号

public slots: // 槽函数
    void slotOperateData(const int &index);

private:
    QString m_data;  // 存储数据的字符串
    QTimer *m_timer; // 定时器，用于模拟倒计时
    int m_count = 0;
};
