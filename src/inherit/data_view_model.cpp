
#include "data_view_model.h"

DataViewModel::DataViewModel(QObject *parent)
    : QObject(parent)
{
    qDebug() << "DataViewModel constructed"; // 打印构造信息
}

DataViewModel::~DataViewModel()
{
    qDebug() << "DataViewModel destructed"; // 打印析构信息
    // qDeleteAll(m_personList);               // 删除Person对象列表中的所有对象
    // m_personList.clear();                   // 清空列表
}

void DataViewModel::fetchData()
{
    qDebug() << "Fetching data..."; // 打印获取数据信息
    // 模拟从数据库中获取数据
    // m_dataList.clear();
    // m_personList.clear();

    // 添加一些示例数据
    for (int i = 0; i < 5; ++i)
    {
        // Person *person = new Person(this);
        // person->setName(QString("Person %1").arg(i));
        // person->setAge(20 + i);
        // m_personList.append(person);

        // 将Person对象转换为QVariant并添加到数据列表中
        // m_dataList.append(QVariant::fromValue(person));

        // 获取数据，以QVariant形式存储
        // QVariantMap data;
        // data["name"] = QString("Person %1").arg(i);
        // data["age"] = 20 + i;
        // m_dataList.append(data);
    }

    // 发出信号通知数据已更新
    // emit dataChanged(m_dataList);

    m_strData = "Data fetched successfully";
    emit strDataChanged(m_strData); // 发出字符串数据变化信号
}

// QList<QVariant> DataViewModel::getDataList() const
// {
//     return m_dataList; // 返回数据列表
// }

// QList<Person *> DataViewModel::getPersonList() const
// {
//     return m_personList; // 返回Person对象列表
// }
