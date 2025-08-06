import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

/**
* 圆角图片
* - 使用蒙版实现圆角效果
* 属性包括
* - imgSrc 图片路径
* - imgRadius 圆角半径
* - 外边框：borderWidth 边框宽度
* - borderColor 边框颜色
* 点击缩放效果
* 鼠标悬停效果
*/
Item {
    id: imgRoot

    property color borderColor: "transparent" // 边框颜色
    property int borderWidth: 0 // 边框宽度
    property int imgRadius: 20 // 圆角半径

    // alias 别名
    property alias imgSrc: ivRound.source // 图片路径

    height: 200
    width: 200

    Rectangle {
        id: ivMask

        anchors.fill: parent
        radius: imgRadius
        visible: false // 只作为蒙版使用，不显示
    }
    Image {
        id: ivRound

        anchors.fill: parent
        visible: false // 原始图像不显示

    }
    OpacityMask {
        // 使用蒙版
        anchors.fill: parent
        maskSource: ivMask // 设置蒙版源
        source: ivRound  // 设置源图片
    }

    // 边框
    Rectangle {
        anchors.fill: parent
        border.color: borderColor
        border.width: borderWidth
        color: "transparent"
        radius: imgRadius
    }

    // 鼠标悬停效果 - 点击缩放效果，可使用动画实现
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            imgRoot.scale = 1.05;
        }
        onExited: {
            imgRoot.scale = 1.0;
        }
        onPressed: {
            imgRoot.scale = 0.95;
        }
        onReleased: {
            imgRoot.scale = 1.05;
        }
    }
}
