import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
* 自定义标题栏
* - 返回按钮
* - 标题文本
* - 顶部时间展示
*/

Item {
    id: titleBar

    property color bgColor: "#dbdee0" // 背景颜色
    property int clicks: 0  // 点击次数
    property alias titleText: tvTitle.text // alias为别名

    // 信号槽函数进行数据通信
    signal titleClicked(int clicks)

    height: 50
    width: parent.width

    Component.onCompleted: {
        console.log("TitleBar Component Completed");
    }

    // 背景
    Rectangle {
        anchors.fill: parent
        color: bgColor
    }
    RowLayout {
        anchors.fill: parent
        spacing: 10

        Button {
            height: parent.height
            text: "返回"

            onClicked: {
                console.log("返回按钮被点击，界面退出");
                stackView.pop();
            }
        }
        Text {
            id: tvTitle

            Layout.fillWidth: true
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter
            text: "标题栏"

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    titleBar.clicks++;
                    console.log("标题栏被点击，点击次数：" + titleBar.clicks);
                    titleClicked(titleBar.clicks); // 触发信号
                }
            }
        }
        Text {
            id: tvTime

            Layout.alignment: Qt.AlignRight
            font.pointSize: 20
            text: Qt.formatDateTime(new Date(), "hh:mm:ss")

            // 通过Timer更新时间
            Timer {
                interval: 1000 // 每秒更新一次
                repeat: true
                running: true

                onTriggered: {
                    tvTime.text = Qt.formatDateTime(new Date(), "hh:mm:ss");
                }
            }
        }
    }
}
