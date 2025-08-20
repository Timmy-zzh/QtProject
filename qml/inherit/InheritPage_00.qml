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
            Text {
                font.pointSize: 16
                text: qsTr("Cpp与QML交互集成")
            }
        }
    }
}
