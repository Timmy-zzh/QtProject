#include "Person.h"
#include <QDebug>

// 构造函数
Person::Person(QObject *parent)
    : QObject(parent), m_name("Default Name"), m_age(0)
{
    qDebug() << "Person constructed"; // 打印构造信息
}

// 析构函数
Person::~Person()
{
    qDebug() << "Person destructed"; // 打印析构信息
}

// 获取姓名
QString Person::name() const
{
    return m_name;
}

// 设置姓名
void Person::setName(const QString &name)
{
    if (m_name != name)
    {
        m_name = name;
        emit nameChanged(m_name); // 发出姓名变化信号
    }
}

// 获取年龄
int Person::age() const
{
    return m_age;
}

// 设置年龄
void Person::setAge(int age)
{
    if (m_age != age)
    {
        m_age = age;
        emit ageChanged(m_age); // 发出年龄变化信号
    }
}
