import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
* MarqueeText 滚动文本组件
* 跑马灯效果 - 普通跑马灯，文字全部移动到左侧不见后，再从右侧重新出现
*/
Item {
    id: root

    property alias color: text1.color
    property alias font: text1.font
    property bool running: true
    property alias text: text1.text

    clip: true
    height: 50
    width: 300

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

        // 滚动控制
        Timer {
            interval: 16  // ~60fps
            repeat: true
            running: metrics.width > root.width && root.running

            onTriggered: {
                text1.x -= 1;  // 根据速度计算位移
                if (text1.x < -text1.width) {
                    text1.x = root.width;  // 循环
                }
            }
        }
    }
}
