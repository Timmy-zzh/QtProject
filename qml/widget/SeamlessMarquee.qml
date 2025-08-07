import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
* MarqueeText 滚动文本组件
* 跑马灯效果 - 无缝循环跑马灯
*/
Item {
    id: root

    property alias color: text1.color
    property alias font: text1.font
    property bool running: true
    property real speed: 50 // 像素/秒 (统一速度)
    property alias text: text1.text

    // 计算实际需要的持续时间
    function calculateDuration() {
        return metrics.width * 1000 / speed;
    }
    function resetAnimations() {
        if (metrics.width > width) {
            text1.x = 0;
            text2.x = metrics.width;
            anim1.duration = calculateDuration();
            anim2.duration = calculateDuration();
            anim1.restart();
            anim2.restart();
        } else {
            text1.x = 0;
        }
    }

    clip: true
    height: 50
    width: 300

    // 文本或宽度变化时重置
    onTextChanged: resetAnimations()
    onWidthChanged: resetAnimations()

    // 精确测量文本宽度
    TextMetrics {
        id: metrics

        font: text1.font
        text: root.text
    }

    // 第一个文本
    Text {
        id: text1

        font.pixelSize: 24
        text: root.text
        x: 0
        y: (parent.height - height) / 2

        NumberAnimation on x {
            id: anim1

            duration: calculateDuration()
            from: 0
            loops: Animation.Infinite
            running: root.running && metrics.width > root.width
            to: -metrics.width
        }
    }

    // 第二个文本
    Text {
        id: text2

        color: text1.color
        font: text1.font
        text: root.text
        visible: metrics.width > root.width
        x: metrics.width
        y: text1.y

        NumberAnimation on x {
            id: anim2

            duration: calculateDuration()
            from: metrics.width
            loops: Animation.Infinite
            running: root.running && metrics.width > root.width
            to: 0
        }
    }

    // 鼠标控制
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: root.running = false
        onExited: root.running = true
    }
}