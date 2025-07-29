import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widget" // 引入widget目录下的组件

/**
* ComponentPage.qml
*
*/
Item {
    id: root

    Component.onCompleted: {
        console.log("ComponentPage Completed");

        // 通过createComponent方法，创建组件实例
        var component = Qt.createComponent("qrc:/widget/TitleBar.qml");
        if (component.status === Component.Ready) {
            var instance = component.createObject(root, {
                titleText: qsTr("Dynamic Title Bar"),
                x: 50,
                y: 50
            });
            if (instance === null) {
                console.error("Failed to create component instance");
            } else {
                console.log("Dynamic Title Bar Created");
            }
        } else if (component.status === Component.Error) {
            console.error("Error creating component:", component.errorString());
        }
    }

    // 使用： 在qml页面中，使用组件，直接通过文件名称引入，需要导入控件路径
    TitleBar {
        id: titleBar

        titleText: qsTr("Component Page")

        onTitleClicked: {
            console.log("Title Bar Title Clicked clicks:" + clicks);
        }
    }
    Component {
        id: titleBarComponent

        TitleBar {
            titleText: qsTr("Dynamic Title Bar")

            onTitleClicked: {
                console.log("Dynamic Title Bar Clicked");
            }
        }
    }
    ScrollView {
        clip: true

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            top: parent.top
            topMargin: 50
        }
        Rectangle {
            anchors.fill: parent

            // 使用1：在qml界面中直接实例化,动态创建
            Item {
                id: itemDirect

                Component.onCompleted: {
                    console.log("Component Direct Item Created");
                    // 直接创建组件实例，使用createObject方法,该组件的父组件是itemDirect
                    let instance = btnComponent.createObject(itemDirect, {
                        x: 50,
                        y: 100
                    });
                    if (instance === null) {
                        console.error("Failed to create component instance");
                    }
                }
            }

            // 使用2：使用Loader加载
            Loader {
                id: loader

                anchors.centerIn: parent
                sourceComponent: btnComponent
            }

            // 定义一个组件按钮
            Component {
                id: btnComponent

                Rectangle {
                    border.color: "blue"
                    border.width: 2
                    color: "lightblue"
                    height: 50
                    radius: 10
                    width: 100

                    Component.onCompleted: {
                        console.log("btnComponent Button Created");
                    }

                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Click Me")
                    }
                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            console.log("Component Button Clicked");
                        }
                    }
                }
            }
        }
    }
}
