import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "./widget" // 引入widget目录下的组件
import "./control"
import "./inherit"

Item {
    id: root

    height: 600
    width: 800

    Component {
        id: controlPage

        ControlPage_00 {
        }
    }
    Component {
        id: inheritPage

        InheritPage_00 {
        }
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
            topMargin: 10
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
                text: qsTr("-- 主页内容 --")
            }
            AnimButton {
                id: animButton

                height: 50
                text: qsTr("跳转到 控件列表页面")
                width: 300

                onBtnClicked: {
                    console.log("onBtnClicked - 跳转到 控件页面");
                    stackView.push(controlPage);
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("-- QML与 C++ 交互 --")
            }
            AnimButton {
                id: secondPageButton

                height: 50
                text: qsTr("跳转到 cpp集成页面")
                width: 300

                onBtnClicked: {
                    console.log("onBtnClicked - 跳转到 cpp集成页面");
                    stackView.push(inheritPage);
                }
            }
        }
    }
}
