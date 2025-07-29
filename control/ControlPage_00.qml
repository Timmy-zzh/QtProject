import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * 控件列表：
 * 1. Item
 * 2. Rectangle
 * 3. Component
 *
 */
Item {
    // Item
    Component {
        id: itemPage

        ItemPage_01 {
        }
    }
    // Rectangle
    Component {
        id: rectanglePage

        RectanglePage_02 {
        }
    }

    // Component， ComponentPage.qml页面的内容，放到Component中了
    Component {
        id: componentPage

        ComponentPage_03 {
        }
    }
    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Text {
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("Welcome to QtProjectApp")
        }
        Text {
            font.pointSize: 20
            text: qsTr("----------- View List -----------")
        }
        Button {
            height: 50
            text: qsTr("Item Page")
            width: 100

            onClicked: stackView.push(itemPage)
        }
        Button {
            height: 50
            text: qsTr("Rectangle Page")
            width: 100

            onClicked: stackView.push(rectanglePage)
        }
        Button {
            height: 50
            text: qsTr("Component Page")
            width: 100

            onClicked: stackView.push(componentPage)
        }
        // 滑动
        Button {
            height: 50
            text: qsTr("ScrollView Page")
            width: 100

            onClicked: stackView.push(itemPage)
        }
        Button {
            height: 50
            text: qsTr("Row and Column Page")
            width: 100

            onClicked: stackView.push(itemPage)
        }
    }
}
