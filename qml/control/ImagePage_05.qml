import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widget" // 引入widget目录下的组件
// 图片效果控件
import Qt5Compat.GraphicalEffects

/**
*
*/
Item {
    id: root

    height: 600
    width: 800

    TitleBar {
        id: titleBar

        titleText: qsTr("Image Page")
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

            Rectangle {
                color: "lightblue"
                height: 50
                width: parent.width

                Text {
                    font.pointSize: 16
                    text: qsTr("Image 图片使用")
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("本地图片")
            }
            // 以相对路径引用图片
            Image {
                height: 300
                source: "qrc:/image/res/image/img_sky.jpg"
                width: 300
            }
            Text {
                font.pointSize: 16
                text: qsTr("加载网络图片")
            }
            // 加载网络图片
            Image {
                height: 300
                source: "http://gips2.baidu.com/it/u=295419831,2920259701&fm=3028&app=3028&f=JPEG&fmt=auto?w=720&h=1280"
                width: 300
            }

            // 图片属性
            Text {
                font.pointSize: 16
                text: qsTr("图片属性")
            }
            Image {
                asynchronous: true // 异步加载图片
                cache: true // 缓存图片
                fillMode: Image.PreserveAspectFit // 保持宽高比缩放图片
                height: 300
                mipmap: true // 启用mipmap，提升缩放质量

                opacity: 0.8 // 图片透明度

                smooth: true // 平滑缩放图片
                source: "http://gips2.baidu.com/it/u=295419831,2920259701&fm=3028&app=3028&f=JPEG&fmt=auto?w=720&h=1280"
                sourceSize: Qt.size(width, height) // 限制图片加载尺寸

                width: 300

                // 监听图片加载状态
                onStatusChanged: {
                    if (status === Image.Ready) {
                        console.log("图片加载完成");
                    } else if (status === Image.Loading) {
                        console.log("图片加载中");
                    } else if (status === Image.Error) {
                        console.log("图片加载失败");
                    }
                }
            }

            // 设置圆形图片 -》自定义控件
            Text {
                font.pointSize: 16
                text: qsTr("圆形图片")
            }
            Item {
                height: 200
                width: 200

                Rectangle {
                    id: mask

                    anchors.fill: parent
                    radius: height / 2 // 设置圆角半径为高度的一半
                    visible: false // 只作为蒙版使用，不显示
                }
                Image {
                    id: image

                    anchors.fill: parent
                    source: "qrc:/image/res/image/img_sky.jpg"
                    visible: false // 原始图像不显示

                }
                OpacityMask {
                    // 使用蒙版
                    anchors.fill: parent
                    maskSource: mask // 设置蒙版源
                    source: image  // 设置源图片
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("圆角图片")
            }
            Item {
                height: 200
                width: 200

                Rectangle {
                    id: mask2

                    anchors.fill: parent
                    radius: 20
                    visible: false // 只作为蒙版使用，不显示
                }
                Image {
                    id: image2

                    anchors.fill: parent
                    source: "qrc:/image/res/image/img_sky.jpg"
                    visible: false // 原始图像不显示

                }
                OpacityMask {
                    // 使用蒙版
                    anchors.fill: parent
                    maskSource: mask2 // 设置蒙版源
                    source: image2  // 设置源图片
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("圆角图片，layer 实现方式")
            }
            Image {
                id: image3

                anchors.horizontalCenter: parent.horizontalCenter
                clip: true // 启用裁剪

                height: 200
                layer.enabled: true // 启用图层
                source: "qrc:/image/res/image/img_sky.jpg"
                width: 200

                layer.effect: OpacityMask {
                    // 设置圆角
                    maskSource: Rectangle {
                        color: "black" // 蒙版颜色
                        height: image3.height
                        radius: 20 // 设置圆角半径
                        width: image3.width
                    }
                }
            }
            Text {
                font.pointSize: 16
                text: qsTr("制作成图片控件，可根据radius属性设置圆角或圆形都行")
            }
            RoundImage {
                anchors.horizontalCenter: parent.horizontalCenter
                height: 200
                imgRadius: 100 // 设置为圆形
                imgSrc: "qrc:/image/res/image/img_sky.jpg"
                width: 200
            }
            RoundImage {
                anchors.horizontalCenter: parent.horizontalCenter
                borderColor: "lightyellow"
                borderWidth: 2
                height: 200
                imgRadius: 10 // 设置圆角
                imgSrc: "http://gips2.baidu.com/it/u=295419831,2920259701&fm=3028&app=3028&f=JPEG&fmt=auto?w=720&h=1280"
                width: 120
            }
        }
    }
}
