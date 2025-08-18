import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
* 动画按钮：
* - 按钮点击时播放动画，
* - 按下时缩小，放松时恢复缩放效果
*/
Rectangle {
    id: animButton

    property alias text: tvText.text

    signal btnClicked

    height: 50
    radius: 10
    width: 100

    gradient: Gradient {
        GradientStop {
            color: "#FF4081"
            position: 0.0
        }
        GradientStop {
            color: "#F50057"
            position: 1.0
        }
    }

    Text {
        id: tvText

        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 20
        text: "Click Me"
    }
    MouseArea {
        anchors.fill: parent

        onClicked: {
            // console.log(" animButton onClicked");
            animButton.btnClicked();
        }
        onPressed: {
            // Start the press animation
            pressAnim.start();
        }
        onReleased: {
            // Start the release animation
            releaseAnim.start();
        }
    }

    // Animation for scaling effect
    NumberAnimation {
        id: pressAnim

        duration: 100
        easing.type: Easing.InOutQuad
        from: 1.0
        property: "scale"
        target: animButton
        to: 0.9
    }
    NumberAnimation {
        id: releaseAnim

        duration: 100
        easing.type: Easing.InOutQuad
        from: 0.9
        property: "scale"
        target: animButton
        to: 1.0
    }

    // Behavior on scale {
    //     NumberAnimation {
    //         duration: 100
    //         easing.type: Easing.InOutQuad
    //     }
    // }
}
