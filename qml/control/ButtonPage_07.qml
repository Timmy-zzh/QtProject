import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widget" // 引入widget目录下的组件

/**
* Button控件
*/
Item {
    id: root

    height: 600
    width: 800

    TitleBar {
        id: titleBar

        titleText: qsTr("Button Page")
    }
    ScrollView {
        clip: true

        anchors {
            bottom: parent.bottom
            left: parent.left
            leftMargin: 20
            right: parent.right
            top: parent.top
            topMargin: 50
        }
        Column {
            anchors.fill: parent
            spacing: 10

            Text {
                font.pointSize: 16
                text: qsTr("Button 控件使用")
            }

            // 按钮
            Button {
                id: button1

                height: 50
                text: qsTr("Button 1")
                width: 200

                // 设置按钮背景
                background: Rectangle {
                    border.color: "blue"
                    border.width: 2
                    // 添加点击效果
                    color: parent.down ? "yellow" : "lightblue"
                    radius: 10
                }

                // 设置按钮文本样式
                contentItem: Text {
                    color: "black"
                    font.pointSize: 16
                    // 文本在按钮中居中显示
                    horizontalAlignment: Text.AlignHCenter
                    text: button1.text
                    verticalAlignment: Text.AlignVCenter
                }

                // 按钮点击时回调的方法
                onCanceled: {
                    console.log("Button 1 canceled");
                }
                onClicked: {
                    console.log("Button 1 clicked");
                }
                onPressed: {
                    console.log("Button 1 pressed");
                }
                onReleased: {
                    console.log("Button 1 released");
                }
                onToggled: {
                    console.log("Button 1 toggled: " + button1.checked);
                }
            }
        }
    }
}
