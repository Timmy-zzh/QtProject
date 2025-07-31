import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widget" // 引入widget目录下的组件

/**
*
*/
Item {
    id: root

    height: 600
    width: 800

    TitleBar {
        id: titleBar

        titleText: qsTr("Loader Page")

        onTitleClicked: {
            console.log("Title Bar Title Clicked clicks:" + clicks);
        }
    }
    Component {
        id: redLayout

        Rectangle {
            color: "red"
            height: 100
            width: 100
        }
    }
    Component {
        id: state1

        Rectangle {
            color: "red"
            height: 100
            width: 100

            Component.onCompleted: {
                console.log("state1 Component.onCompleted");
            }
            Component.onDestruction: {
                console.log("state1 Component.onDestruction");
            }
        }
    }
    Component {
        id: state2

        Rectangle {
            color: "green"
            height: 100
            width: 100

            Component.onCompleted: {
                console.log("state2 Component.onCompleted");
            }
            Component.onDestruction: {
                console.log("state2 Component.onDestruction");
            }
        }
    }
    Component {
        id: state3

        BlueRect {
            height: 100
            width: 100

            Component.onCompleted: {
                console.log("state3 Component.onCompleted");
            }
            Component.onDestruction: {
                console.log("state3 Component.onDestruction");
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
        Column {
            anchors.fill: parent
            spacing: 10

            Rectangle {
                color: "lightblue"
                height: 50
                width: parent.width

                Text {
                    font.pointSize: 16
                    text: qsTr("Loader.source 方式直接加载TitleBar.qml文件")
                }
            }

            // widget/TitleBar.qml
            Item {
                height: 100
                width: parent.width

                Loader {
                    id: loader1

                    active: true  // 激活Loader(默认true)
                    asynchronous: true  // 异步加载(默认false)
                    source: "qrc:/widget/TitleBar.qml"
                    sourceComponent: null  // source和sourceComponent不能同时使用

                    width: parent.width

                    onLoaded: {
                        console.log("Loader1 Loaded");
                        // item是加载的组件实例
                        item.titleText = qsTr("Loader1 Title Bar");
                    }
                    onStateChanged: {
                        console.log("Loader1 State Changed: " + state);
                        if (status === Loader.Ready) {
                            console.log("Loader1 is Ready");
                        } else if (status === Loader.Loading) {
                            // progress 是加载进度，范围从0到1
                            console.log("Loader1 is Loading progress:" + progress);
                        } else if (status === Loader.Error) {
                            console.log("Loader1 Error: " + errorString);
                        }
                    }
                }
            }
            Rectangle {
                color: "lightyellow"
                height: 50
                width: parent.width

                Text {
                    font.pointSize: 16
                    text: qsTr("Loader.sourceComponent方式加载Component控件")
                }
            }
            Loader {
                id: loader2

                sourceComponent: redLayout
            }

            // Loader与State配合使用
            Rectangle {
                id: rect

                color: "#11814053"
                height: 200
                width: 800

                states: [
                    State {
                        name: "state1"

                        PropertyChanges {
                            sourceComponent: state1
                            target: stateLoader
                        }
                    },
                    State {
                        name: "state2"

                        PropertyChanges {
                            sourceComponent: state2
                            target: stateLoader
                        }
                    },
                    State {
                        name: "state3"

                        PropertyChanges {
                            sourceComponent: state3
                            target: stateLoader
                        }
                    }
                ]

                Row {
                    height: 50
                    width: parent.width

                    Button {
                        text: qsTr("state1")

                        onClicked: {
                            rect.state = "state1";
                        }
                    }
                    Button {
                        text: qsTr("state2")

                        onClicked: {
                            rect.state = "state2";
                        }
                    }
                    Button {
                        text: qsTr("state3")

                        onClicked: {
                            rect.state = "state3";
                        }
                    }
                }
                Item {
                    height: 200
                    width: 200

                    anchors {
                        top: parent.top
                        topMargin: 60
                    }
                    Loader {
                        id: stateLoader

                    }
                }
            }

            // Loader根据状态加载不同的组件
            Rectangle {
                id: stateRect

                property int stateIndex: 100

                color: "lightgreen"
                height: 200
                width: 800

                Text {
                    font.pointSize: 16
                    height: 20
                    text: qsTr("Loader根据状态加载不同的组件")
                }
                Row {
                    height: 20
                    width: parent.width

                    anchors {
                        top: parent.top
                        topMargin: 30
                    }
                    Button {
                        text: qsTr("red")

                        onClicked: {
                            stateRect.stateIndex = 100;
                        }
                    }
                    Button {
                        text: qsTr("green")

                        onClicked: {
                            stateRect.stateIndex = 101;
                        }
                    }
                    Button {
                        text: qsTr("blue")

                        onClicked: {
                            stateRect.stateIndex = 102;
                        }
                    }
                }
                Item {
                    height: 100
                    width: 100

                    anchors {
                        top: parent.top
                        topMargin: 80
                    }
                    Loader {
                        id: stateLoader2

                        anchors.fill: parent
                        sourceComponent: {
                            if (stateRect.stateIndex === 100) {
                                return state1;
                            } else if (stateRect.stateIndex === 101) {
                                return state2;
                            } else if (stateRect.stateIndex === 102) {
                                return state3;
                            }
                            return null;
                        }
                    }
                }
            }
        }
    }

    component BlueRect: Item {
        anchors.fill: parent

        Rectangle {
            color: "blue"
            height: 100
            width: 100
        }
    }
}
