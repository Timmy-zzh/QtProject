import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widget" // 引入widget目录下的组件

/**
* 倒计时控件
*/
Item {
    id: root

    height: 600
    width: 800

    TitleBar {
        id: titleBar

        titleText: qsTr("Timer Page")
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
            id: column

            property int timeValue: 10

            anchors.fill: parent
            spacing: 10
            width: parent.width

            anchors {
                left: parent.left
                leftMargin: 20
            }
            Text {
                font.pointSize: 16
                text: qsTr("Timer 控件使用")
            }
            Timer {
                id: myTimer

                interval: 1000  // 1秒
                repeat: true    // 重复
                running: false // 是否启动

                onTriggered: {
                    console.log("Timer onTriggered");
                    if (column.timeValue > 0) {
                        column.timeValue--;
                    } else {
                        myTimer.stop();
                    }
                }
            }
            Text {
                id: timeText

                font.pointSize: 24
                text: qsTr("倒计时: %1 秒").arg(column.timeValue)
            }
            Button {
                height: 50
                text: qsTr("开始倒计时")
                width: 200

                onClicked: {
                    column.timeValue = 10;
                    myTimer.start();
                }
            }
            Button {
                height: 50
                text: qsTr("停止倒计时")
                width: 200

                onClicked: {
                    myTimer.stop();
                }
            }
        }
    }
}
