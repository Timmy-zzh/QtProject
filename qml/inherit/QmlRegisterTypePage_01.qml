import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widget" // 引入widget目录下的组件

// 引入C++类的模块
import com.timmy.qml 1.0

/**
* cpp与qml集成，使用qmlRegisterType注册C++类到QML中
* 功能实现：
* 1、在qml界面中使用C++类，获取到该C++类的实例
* 2、调用该C++类的方法
* 3、使用C++类的信号与QML的槽函数进行连接
* - 用户点击后，C++类的槽函数会被调用，进行数据处理后，通知QML界面更新
* 实现方式：
* 1、创建C++类，继承自QObject
* - 在C++类中使用Q_PROPERTY宏定义属性
* - 在C++类中使用Q_INVOKABLE宏定义方法
* 2、在C++类中使用qmlRegisterType注册该类到QML中 （main方法中注册）
* - 使用qmlRegisterType<CppCountDown>("CppCountDown", 1, 0, "CppCountDown");
* 3、在QML中使用该C++类
* - 使用CppCountDown { id: cppCountDown } 创建C++类的实例
* - 通过id获取到该C++类的实例
* - 调用该C++类的方法
* - 连接C++类的信号与QML的槽函数
* 4、在QML中使用该C++类的属性
* - 使用cppCountDown.propertyName获取C++类的属性值
*/
Item {
    id: root

    height: 600
    width: 800

    Component.onCompleted: {
        console.log("QmlRegisterTypePage_01 - onCompleted");
        console.log("dataManager.data:" + dataManager.data + " ,dataManager:" + (dataManager === null ? "null" : "not null"));
    }

    // C++类的实例
    // DataManager {
    //     id: dataManager

    //     // 方式2：槽函数,这样也可以获取信号函数的回调
    //     onCurrTimerChanged: function (currTimer) {
    //         console.log("DataManager - onCurrTimerChanged - 当前倒计时：" + currTimer);
    //         // 更新QML界面上的文本
    //         tvTime.text = qsTr("倒计时时间：") + currTimer;
    //     }

    //     // 方式3：不会调用，是普通的JavaScript函数,不会用于绑定信号到槽函数
    //     // function onCurrTimerChanged(currTimer) {
    //     //     console.log("DataManager - onCurrTimerChanged - 当前倒计时：" + currTimer);
    //     //     // 更新QML界面上的文本
    //     //     tvTime.text = qsTr("倒计时时间：") + currTimer;
    //     // }
    // }

    // 方式1：连接，信号与槽函数
    // Connections {
    //     function onCurrTimerChanged(currTimer) {
    //         console.log("onCurrTimerChanged - 当前倒计时：" + currTimer);
    //         // 更新QML界面上的文本
    //         tvTime.text = qsTr("倒计时时间：") + currTimer;
    //     }

    //     target: dataManager
    // }
    TitleBar {
        id: titleBar

        titleText: qsTr("使用qmlRegisterType使用cpp与qml集成")
    }
    ScrollView {
        clip: true
        height: parent.height
        width: parent.width

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            top: parent.top
            topMargin: titleBar.height
        }
        Column {
            anchors.fill: parent
            spacing: 10
            width: parent.width

            anchors {
                left: parent.left
                leftMargin: 20
            }
            Text {
                id: tvTime

                font.pointSize: 16
                text: qsTr("倒计时时间：")
            }
            // 开始倒计时按钮
            Button {
                id: btnStart

                height: 50
                text: qsTr("开始倒计时")
                width: 300

                onClicked: {
                    console.log("onClicked - 开始倒计时");
                    // 调用C++类的 startCountDown 方法,
                    dataManager.onStartCountdown();
                }
            }
        }
    }
}
