import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widget" // 引入widget目录下的组件

/**
* CPP与qml交互，集成C++类到QML中
*/
Item {
    id: root

    height: 600
    width: 800

    Component {
        id: qmlRegisterTypePage

        QmlRegisterTypePage_01 {
        }
    }
    TitleBar {
        id: titleBar

        titleText: qsTr("Cpp与QML交互集成")
    }
    ScrollView {
        clip: true
        height: parent.height
        width: parent.width

        anchors {
            bottom: parent.bottom
            left: parent.left
            // leftMargin: 20
            right: parent.right
            top: parent.top
            topMargin: 50
        }
        Column {
            anchors.fill: parent
            spacing: 10
            width: parent.width

            anchors {
                left: parent.left
                leftMargin: 20
            }
            AnimButton {
                id: animButton

                height: 50
                text: qsTr("使用 qmlRegisterType 实现方式")
                width: 300

                onBtnClicked: {
                    console.log("onBtnClicked - 使用 qmlRegisterType 实现方式");
                    stackView.push(qmlRegisterTypePage);
                }
            }
        }
    }
}
