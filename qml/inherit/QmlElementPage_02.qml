import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widget" // 引入widget目录下的组件

import com.timmy.qml 1.0

/**
* cpp与qml集成，使用QML_ELEMENT 宏实现
* 该方式可以在C++中使用QML_ELEMENT宏注册一个QML元素，替代 qmlRegisterType
*/
Item {
    id: root

    height: 600
    width: 800

    Component.onCompleted: {
        console.log(qsTr("QmlElementPage_02 - onCompleted"));
    }

    // C++类的实例
    DataViewModel {
        id: dataViewModel

    }
    Connections {
        function onStrDataChanged(strData) {
            console.log("DataViewModel - onStrDataChanged - 字符串数据更新：" + strData);
        }

        target: dataViewModel
    }
    TitleBar {
        id: titleBar

        titleText: qsTr("使用 Q_ELEMENT 使用cpp与qml集成")
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
            Button {
                id: btnStart

                height: 50
                text: qsTr("获取数据")
                width: 300

                onClicked: {
                    console.log("onClicked - 获取数据");
                    dataViewModel.fetchData();
                }
            }
            Text {
                id: tvData

                font.pointSize: 16
                text: qsTr("数据：")
            }
        }
    }
}
