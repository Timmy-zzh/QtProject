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

        titleText: qsTr("Row RowLayout Page")
    }
    ScrollView {
        clip: true
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

            Text {
                font.pointSize: 16
                text: qsTr("Row 控件使用")
            }
            Rectangle {
                color: "#21a769"
                height: 150
                width: 600

                Row {
                    // alignment: Qt.AlignBottom
                    layoutDirection: Qt.LeftToRight  // 水平布局
                    padding: 10 // 内边距
                    spacing: 10 // 内部子控件的间距

                    anchors {
                        right: parent.right
                    }
                    Rectangle {
                        color: "red"
                        height: 100
                        width: 100

                        // anchors {        // 无效，Row内部子控件中不能使用anchors布局
                        //     left: parent.left
                        //     leftMargin: 50
                        // }
                    }
                    Rectangle {
                        color: "green"
                        height: 100
                        width: 100
                    }
                    Rectangle {
                        color: "blue"
                        height: 100
                        width: 100
                    }
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("RowLayout 控件使用")
            }
            RowLayout {
                spacing: 10 // 内部子控件的间距

                width: parent.width

                Button {
                    Layout.preferredWidth: 100 // 设置按钮的首选宽度
                    text: qsTr("固定宽度")
                }
                TextField {
                    Layout.fillWidth: true // 设置按钮填充剩余空间
                    text: qsTr("自动宽度")
                }
                Button {
                    Layout.maximumWidth: 200 // 设置按钮的最大宽度
                    Layout.minimumWidth: 100 // 设置按钮的最小宽度
                    text: qsTr("自适应")
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("Column 控件使用")
            }
            Column {
                spacing: 10 // 内部子控件的间距

                width: parent.width

                Rectangle {
                    color: "red"
                    height: 100
                    width: 100
                }
                Rectangle {
                    color: "green"
                    height: 100
                    width: 100
                }
                Rectangle {
                    color: "blue"
                    height: 100
                    width: 100
                }
            }
        }
    }
}
