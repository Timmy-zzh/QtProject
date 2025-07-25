import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Item {
    Component.onCompleted: {
        console.log("RectanglePage  Component.onCompleted");
    }
    Component.onDestruction: {
        console.log("RectanglePage  Component.onDestruction");
    }

    Button {
        id: btnBack

        height: 50
        text: qsTr("Go Back")
        width: 100

        onClicked: stackView.pop()
    }
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        font.pointSize: 20
        text: qsTr("Rectangle Page")
    }
    ScrollView {
        anchors.top: btnBack.bottom
        clip: true
        height: parent.height - btnBack.height
        width: parent.width

        Column {
            anchors.fill: parent
            spacing: 10

            Rectangle {
                border.color: "black"  // 边框颜色
                border.width: 2  // 边框宽度
                color: "blue"  // 填充颜色
                height: 100
                radius: 10  // 圆角半径
                width: 200
            }
            Rectangle {
                // 设置控件边框宽度和颜色
                border.color: "black"
                border.width: 2
                // 设置控件颜色
                // color: "red"
                // color: "#FFA500"
                color: Qt.rgba(1, 0.647, 0, 0.5) // 橙色
                height: 200
                opacity: 0.8 // 设置控件透明度

                // 设置控件圆角
                radius: 20
                rotation: 30 // 设置控件旋转角度
                scale: 0.8 // 设置控件缩放比例
                width: 200

                // 设置渐变填充色,gradient 会覆盖 color
                gradient: Gradient {
                    GradientStop {
                        color: "red"
                        position: 0.0
                    }
                    GradientStop {
                        color: "yellow"
                        position: 1.0
                    }
                }

                // anchors {
                //     top: parent.top
                //     topMargin: 10
                // }

                // 接收鼠标点击事件
                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        console.log("Rectangle clicked");
                    }
                }
            }
            Rectangle {
                height: 100
                width: 200

                // 渐变填充
                gradient: Gradient {
                    GradientStop {
                        color: "red"
                        position: 0.0
                    }
                    GradientStop {
                        color: "yellow"
                        position: 1.0
                    }
                }
            }

            // 使用Rectangle制作阴影效果
            Rectangle {
                height: 100

                // 阴影效果
                layer.enabled: true
                width: 200

                // 渐变填充
                gradient: Gradient {
                    GradientStop {
                        color: "red"
                        position: 0.0
                    }
                    GradientStop {
                        color: "yellow"
                        position: 1.0
                    }
                }
                layer.effect: DropShadow {
                    color: "#8000ff00"
                    radius: 8
                    samples: 16
                }
            }

            // 使用Rectangle制作圆形
            Rectangle {
                color: "green"
                height: 100
                radius: width / 2  // 设置为宽度的一半即为圆形
                width: 100
            }

            // 使用Rectangle制作按钮
            Rectangle {
                id: button

                color: mouseArea.containsMouse ? "#4CAF50" : "#8BC34A"
                height: 40
                radius: 5
                width: 120

                Text {
                    anchors.centerIn: parent
                    color: "white"
                    font.pixelSize: 16
                    text: "Click Me"
                }
                MouseArea {
                    id: mouseArea

                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: console.log("Button clicked!")
                }
            }

            // 使用Rectangle制作卡片
            Rectangle {
                border.color: "#e0e0e0"
                border.width: 1
                color: "white"
                height: 200
                layer.enabled: true
                radius: 8
                width: 300

                layer.effect: DropShadow {
                    color: "#20000000"
                    radius: 8
                    samples: 16
                }

                Column {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 8

                    Text {
                        font.bold: true
                        font.pixelSize: 18
                        text: "Card Title"
                    }
                    Rectangle {
                        // 分割线
                        color: "#e0e0e0"
                        height: 1
                        width: parent.width
                    }
                    Text {
                        text: "This is the content of the card. It can contain any QML elements."
                        width: parent.width
                        wrapMode: Text.WordWrap
                    }
                }
            }
        }
    }
}
