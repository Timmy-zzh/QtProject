#include "DataManager.h"

// 构造函数
DataManager::DataManager(QObject *parent)
    : QObject(parent), m_data("1234444"), m_timer(nullptr)
{
    qDebug() << "DataManager constructed"; // 打印构造信息
    // connect(otherptr, &DataManager::operateDataFinished, this, &DataManager::slotOperateData);
}

// 析构函数
DataManager::~DataManager()
{
    qDebug() << "DataManager destructed"; // 打印析构信息
    // disconnect(otherptr, &DataManager::operateDataFinished, this, &DataManager::slotOperateData);
    if (m_timer)
    {
        m_timer->stop(); // 停止定时器
        delete m_timer;  // 删除定时器对象
        m_timer = nullptr;
    }
}

// 获取数据
QString DataManager::data() const
{
    return m_data;
}

// 设置数据
void DataManager::setData(const QString &data)
{
    if (m_data != data)
    {
        m_data = data;
        emit dataChanged(m_data); // 发出数据变化信号
    }
}

// 操作数据
void DataManager::operateData(const int &index)
{
    // 模拟数据操作
    QString newData = QString("Data at index %1").arg(index);
    setData(newData);                  // 设置新数据并发出信号
    emit operateDataFinished(newData); // 发出操作完成信号
}

// 开始倒计时
void DataManager::onStartCountdown()
{
    // 打印
    qDebug() << "Countdown started";

    // 模拟倒计时开始
    if (!m_timer)
    {
        m_timer = new QTimer(this);
        connect(m_timer, &QTimer::timeout, this, [this]()
                {
                    qDebug() << "Countdown ticked:" << this->m_count;
                    this->m_count++;
                    QString currTimer = QString("Countdown at %1 seconds").arg(this->m_count);
                    qDebug() << currTimer; // 打印当前计时器状态
                    emit currTimerChanged(currTimer); // 发出当前计时器变化信号
                });
    }
    m_timer->setInterval(1000); // 设置定时器间隔为1秒
    m_timer->start();           // 每秒触发一次
}

// 停止倒计时
void DataManager::onStopCountdown()
{
    qDebug() << "Countdown stopped";
    // 模拟倒计时停止
    if (m_timer && m_timer->isActive())
    {
        m_timer->stop();                            // 停止定时器
        emit currTimerChanged("Countdown stopped"); // 发出当前计时器变化信号
    }
}

// 槽函数，处理数据操作完成信号
void DataManager::slotOperateData(const int &index)
{
    qDebug() << "Data operation finished for index:" << index;
    // 这里可以添加更多的处理逻辑
    // operateData(index); // 调用 operateData 方法
}
