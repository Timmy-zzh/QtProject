import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widget" // 引入widget目录下的组件

/**
* Text文字控件
*/
Item {
    id: root

    height: 600
    width: 800

    TitleBar {
        id: titleBar

        titleText: qsTr("Text Page")
    }
    ScrollView {
        clip: true

        anchors {
            bottom: parent.bottom
            left: parent.left
            leftMargin: 20
            right: parent.right
            top: parent.top
            topMargin: 50
        }
        Column {
            anchors.fill: parent
            spacing: 10

            Text {
                font.pointSize: 16
                text: qsTr("跑马灯效果:")
            }
            // 跑马灯效果
            CommonMarquee {
                id: marqueeText0

                text: qsTr("跑马灯效果：This is a marquee text that scrolls across the screen end...")
            }
            SeamlessMarquee {
                id: marqueeText

                // color: "green"
                // duration: 10000
                // font.pointSize: 16
                text: qsTr("跑马灯效果：This is a marquee text that scrolls across the screen end...")
            }

            // 跑马灯2，不同的text内容
            SeamlessMarquee {
                id: marqueeText2

                color: "red"
                text: qsTr("Another example of marquee text with end...")
            }
            SeamlessMarquee {
                id: marqueeText3

                text: qsTr("111 end...")
            }
            Text {
                font.pointSize: 16
                text: qsTr("Text 普通使用")
            }
            Rectangle {
                color: "lightblue"
                height: 300
                width: 300

                // Text的背景矩形
                Rectangle {
                    color: "#d55a60"
                    height: tvText.height // 设置矩形高度与文本高度一致
                    width: tvText.width // 设置矩形宽度与文本宽度一致

                    anchors {
                        bottom: tvText.bottom // 矩形底部与文本底部对齐
                        left: tvText.left // 矩形左侧与文本左侧对齐
                        right: tvText.right // 矩形右侧与文本右侧对齐
                        top: tvText.top // 矩形顶部与文本顶部对齐
                    }
                }
                Text {
                    id: tvText

                    clip: false // 设置文本裁剪
                    color: "#0a12f2"   // 设置字体颜色
                    elide: Text.ElideRight  // 设置文本过长时省略方式

                    font.pointSize: 16 // 设置字体大小
                    height: 200
                    horizontalAlignment: Text.AlignHCenter // 水平对齐方式
                    opacity: 0.8 // 设置文本透明度

                    style: Text.Raised // 设置文本样式
                    styleColor: "darkblue" // 设置文本样式颜色
                    text: qsTr("Text 文本控件属性,温柔IT界老数据法兰经过了拉多少积分代理费啊") // 设置文本内容

                    verticalAlignment: Text.AlignVCenter // 垂直对齐方式
                    visible: true // 设置文本可见性
                    width: 200
                    wrapMode: Text.WordWrap // 设置文本换行方式

                    anchors {
                        // 文本居中：实现方式2
                        centerIn: parent // 将文本居中对齐到父元素
                        // 文本居中：实现方式1
                        // horizontalCenter: parent.horizontalCenter // 水平居中对齐
                        // verticalCenter: parent.verticalCenter // 垂直居中对齐
                    }
                    font {
                        bold: true // 设置粗体
                        family: "Arial" // 设置字体
                        italic: true // 设置斜体
                        underline: true // 设置下划线
                    }
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("Text 富文本使用 <b>Bold</b> <i>Italic</i> <u>Underlined</u>")
            }
            Text {
                horizontalAlignment: Text.AlignHCenter
                text: " 文本对齐与换行： This is a long text that needs to be wrapped properly in the given width."
                width: 200
                wrapMode: Text.WordWrap
            }
            Text {
                elide: Text.ElideRight  // 在右侧显示省略号
                text: "文本省略：This text is too long for the given width"
                width: 200
            }
            Text {
                color: "yellow"
                font.pixelSize: 28
                style: Text.Outline
                styleColor: "gray"
                text: "带样式的文本：Styled Text"
            }
        }
    }
}
