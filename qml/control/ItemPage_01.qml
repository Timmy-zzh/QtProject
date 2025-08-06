import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
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
        text: qsTr("Item Page")
    }
    ScrollView {
        anchors.top: btnBack.bottom
        clip: true
        height: parent.height - btnBack.height
        width: parent.width

        Column {
            anchors.fill: parent
            spacing: 10

            // 基本属性使用
            Item {
                // clip: true
                enabled: true
                height: 100
                // visible: false
                opacity: 0.3
                width: 100

                Rectangle {
                    color: "red"
                    height: 200
                    width: 200
                }
            }
            Item {
                height: 200
                width: 200
            }

            // 作为容器使用
            Item {
                focus: true
                height: 200
                width: 200

                Keys.onPressed: {
                    // 键盘事件处理
                    if (event.key === Qt.Key_Escape) {
                        console.log("Escape key pressed");
                        stackView.pop();
                    } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        console.log("Return or Enter key pressed");
                    } else {
                        console.log("Other key pressed: " + event.key);
                    }
                }

                Rectangle {
                    anchors.centerIn: parent
                    color: "lightblue"
                    height: 100
                    width: 100
                }
                Text {
                    anchors.bottom: parent.bottom
                    text: qsTr("This is a Item")
                }
                MouseArea {
                    // 鼠标区域点击
                    anchors.fill: parent

                    onClicked: {
                        console.log("Item clicked");
                    }
                }
            }

            // 锚定布局
            Item {
                height: 200
                width: 200

                Rectangle {
                    color: "blue"

                    anchors {
                        bottom: parent.bottom
                        left: parent.left
                        margins: 10
                        right: parent.right
                        top: parent.top
                    }
                }
            }

            // 位置绑定
            Item {
                height: 200
                width: 200

                Rectangle {
                    color: "green"
                    height: parent.height / 2
                    width: parent.width / 2
                    x: parent.width / 4
                    y: parent.height / 4
                }
            }
            // 变换操作
            Item {
                height: 200
                width: 200

                transform: [
                    // 平移
                    Translate {
                        x: 150
                        y: 2
                    },
                    Rotation {
                        angle: 45
                    },
                    Scale {
                        xScale: 1.2
                    }
                ]

                Rectangle {
                    anchors.fill: parent
                    color: "yellow"
                }
            }
        }
    }
}
