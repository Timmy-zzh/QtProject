import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "./qml"

ApplicationWindow {
    id: mainWindow

    color: "lightgray"
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowSystemMenuHint
    height: 600
    maximumHeight: 800
    maximumWidth: 1000
    title: qsTr("QtProjectApp")
    visible: true
    width: 800
    x: 100
    y: 50

    Component {
        id: mainPage

        HomePage {
        }
    }
    Component {
        id: secondPage

        SecondPage {
        }
    }
    StackView {
        id: stackView

        anchors.fill: parent
        initialItem: mainPage

        /**
        当调用 stackView.pop() 返回时，有两个页面参与过渡：
        当前页面退出（使用 popExit 动画）
        前一个页面重新显示（使用 popEnter 动画）
        popEnter 专门控制重新显示的页面如何呈现
        */
        popEnter: Transition {
            // 页面返回时的动画
            NumberAnimation {
                duration: 300
                from: 0.0
                properties: "opacity" // 动画属性：透明度
                to: 1.0
            }
        }
        popExit: Transition {
            // 页面返回时的动画
            NumberAnimation {
                duration: 300
                from: 1
                properties: "opacity"
                to: 0
            }
        }
        pushEnter: Transition {
            // 页面进入时的动画
            NumberAnimation {
                duration: 300
                from: 0
                properties: "opacity"
                to: 1
            }
        }
        pushExit: Transition {
            // 页面退出时的动画
            NumberAnimation {
                duration: 300
                from: 1
                properties: "opacity"
                to: 0
            }
        }
        replaceEnter: Transition {
            // 页面替换时的动画
            NumberAnimation {
                duration: 300
                from: 0
                properties: "opacity"
                to: 1
            }
        }
        replaceExit: Transition {
            // 页面替换时的动画
            NumberAnimation {
                duration: 300
                from: 1
                properties: "opacity"
                to: 0
            }
        }

        onDepthChanged: {
            // 当堆栈深度变化时，打印当前深度
            console.log("Current stack depth:", stackView.depth);
        }
    }
}
