import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widget" // 引入widget目录下的组件

/**
* 动画控件
*/
Item {
    id: root

    height: 600
    width: 800

    TitleBar {
        id: titleBar

        titleText: qsTr("Animation Page")
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
            anchors.fill: parent
            spacing: 10
            width: parent.width

            anchors {
                left: parent.left
                leftMargin: 20
            }
            Text {
                font.pointSize: 16
                text: qsTr("Animation 控件使用")
            }
            AnimButton {
                id: animButton

                height: 50
                text: qsTr("点击我 - 使用 AnimButton")
                width: 300

                onBtnClicked: {
                    console.log("onBtnClicked 111");
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("属性动画 - PropertyAnimation")
            }
            Rectangle {
                id: animRect

                color: "#21a769"
                height: 100
                width: 100
            }
            PropertyAnimation {
                id: propertyAnimation

                duration: 1000
                easing.type: Easing.OutBounce // 设置缓动类型 OutBounce 弹跳效果  Easing.InOutQuad
                from: 100
                loops: 3 // 设置动画无限重复  Animation.Infinite
                property: "width" // 动画目标属性
                running: false // 设置为true以开始动画
                target: animRect
                to: 200
            }
            Button {
                text: qsTr("开始动画 - 使用 PropertyAnimation 改变 width 属性")

                onClicked: {
                    propertyAnimation.property = "width"; // 设置动画目标属性
                    animRect.width = 100; // 点击按钮时改变目标属性
                    animRect.height = 100; // 点击按钮时改变目标属性
                    propertyAnimation.running = true; // 开始动画
                }
            }
            Button {
                text: qsTr("开始动画 - 使用 PropertyAnimation 改变 height 属性")

                onClicked: {
                    propertyAnimation.property = "height"; // 设置动画目标属性
                    animRect.width = 100; // 点击按钮时改变目标属性
                    animRect.height = 100; // 点击按钮时改变目标属性
                    propertyAnimation.running = true; // 开始动画
                }
            }
            Button {
                text: qsTr("开始动画 - 使用 PropertyAnimation 改变 opacity 属性")

                onClicked: {
                    propertyAnimation.property = "opacity"; // 设置动画目标属性
                    animRect.width = 100; // 点击按钮时改变目标属性
                    animRect.height = 100; // 点击按钮时改变目标属性
                    animRect.opacity = 0; // 点击按钮时改变目标属性
                    propertyAnimation.from = 0; // 设置动画起始值
                    propertyAnimation.to = 1; // 设置动画结束值
                    propertyAnimation.loops = 3; // 设置动画无限重复Animation.Infinite ， 设置具体的次数可以使用数字
                    propertyAnimation.running = true; // 开始动画
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("数字动画 - NumberAnimation")
            }
            Rectangle {
                id: numberAnimRect

                color: "#21a769"
                height: 100
                width: 100
            }
            NumberAnimation {
                id: numberAnimation

                duration: 1000
                from: 0
                property: "x"   // 动画目标属性
                running: true       // 设置为true以开始动画
                target: numberAnimRect
                to: 100
            }
            Button {
                text: qsTr("开始动画 - 使用 NumberAnimation 改变 x 属性")

                onClicked: {
                    numberAnimation.running = true; // 开始动画
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("颜色动画 - ColorAnimation")
            }
            Rectangle {
                id: colorAnimRect

                color: "#21a769"
                height: 100
                width: 100
            }
            ColorAnimation {
                id: colorAnimation

                duration: 1000
                from: "#21a769"
                property: "color" // 动画目标属性
                running: true // 设置为true以开始动画
                target: colorAnimRect
                to: "#d55a60"
            }
            Button {
                text: qsTr("开始动画 - 使用 ColorAnimation 改变 color 属性")

                onClicked: {
                    colorAnimation.running = true; // 开始动画
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("旋转动画 - RotationAnimation")
            }
            Rectangle {
                id: rotationAnimRect

                color: "#21a769"
                height: 100
                width: 100
            }
            RotationAnimation {
                id: rotationAnimation

                duration: 1000
                from: 0
                property: "rotation" // 动画目标属性
                running: true // 设置为true以开始动画
                target: rotationAnimRect
                to: 360
            }
            Button {
                text: qsTr("开始动画 - 使用 RotationAnimation 改变 rotation 属性")

                onClicked: {
                    rotationAnimation.running = true; // 开始动画
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("并行动画 - ParallelAnimation")
            }
            Rectangle {
                id: parallelAnimRect

                color: "#21a769"
                height: 100
                width: 100
            }
            ParallelAnimation {
                id: parallelAnimation

                NumberAnimation {
                    duration: 1000
                    from: 100
                    property: "width" // 动画目标属性
                    target: parallelAnimRect
                    to: 200
                }
                ColorAnimation {
                    duration: 1000
                    from: "#21a769"
                    property: "color" // 动画目标属性
                    target: parallelAnimRect
                    to: "#d55a60"
                }
            }
            Button {
                text: qsTr("开始动画 - 使用 ParallelAnimation 并行动画")

                onClicked: {
                    parallelAnimation.running = true; // 开始动画
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("序行动画 - SequentialAnimation")
            }
            Rectangle {
                id: sequentialAnimRect

                color: "#21a769"
                height: 100
                width: 100
            }
            SequentialAnimation {
                id: sequentialAnimation

                NumberAnimation {
                    duration: 1000
                    from: 100
                    property: "width" // 动画目标属性
                    target: sequentialAnimRect
                    to: 200
                }
                ColorAnimation {
                    duration: 1000
                    from: "#21a769"
                    property: "color" // 动画目标属性
                    target: sequentialAnimRect
                    to: "#d55a60"
                }
            }
            Button {
                text: qsTr("开始动画 - 使用 SequentialAnimation 序行动画")

                onClicked: {
                    sequentialAnimation.running = true; // 开始动画
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("使用Behavior 监听属性变化，再应用动画")
            }
            Rectangle {
                id: behaviorAnimRect

                color: "#21a769"
                height: 100
                width: 100

                Behavior on color {
                    ColorAnimation {
                        duration: 1000
                        from: "#21a769"
                        to: "#d55a60"
                    }
                }
                Behavior on width {
                    NumberAnimation {
                        duration: 500
                    }
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        // 点击矩形时改变属性，触发Behavior动画
                        behaviorAnimRect.width += 50; // 改变宽度
                    }
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("路径动画 - PathAnimation")
            }
            Rectangle {
                id: pathAnimRect

                color: "#21a769"
                height: 100
                width: 100
            }
            PathAnimation {
                id: pathAnimation

                duration: 2000
                target: pathAnimRect

                path: Path {
                    startX: 0
                    startY: 0

                    PathLine {
                        x: 200
                        y: 0
                    }
                    PathQuad {
                        controlX: 300
                        controlY: 100
                        x: 200
                        y: 200
                    }
                }
            }
            Button {
                text: qsTr("开始动画 - 使用 PathAnimation 路径动画")

                onClicked: {
                    pathAnimation.running = true; // 开始动画
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("精灵动画 - SpriteAnimation")
            }
        }
    }
}
