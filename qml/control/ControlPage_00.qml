import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * 控件列表：
 * 1. Item
 * 2. Rectangle
 * 3. Component
 * 4. Loader
 * 5. Image
 * 6。Text
 * 7. Button
 * 8. Row RowLayout
 * 9. Column ColumnLayout
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

    // Loader
    Component {
        id: loaderPage

        LoaderPage_04 {
        }
    }

    // Image
    Component {
        id: imagePage

        ImagePage_05 {
        }
    }

    // Text
    Component {
        id: textPage

        TextPage_06 {
        }
    }

    // Button
    Component {
        id: buttonPage

        ButtonPage_07 {
        }
    }

    // Row RowLayout
    Component {
        id: rowLayoutPage

        RowLayoutPage_08 {
        }
    }

    // Content
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
            text: qsTr("1. Item")
            width: 100

            onClicked: stackView.push(itemPage)
        }
        Button {
            height: 50
            text: qsTr("2. Rectangle")
            width: 100

            onClicked: stackView.push(rectanglePage)
        }
        Button {
            height: 50
            text: qsTr("3. Component")
            width: 100

            onClicked: stackView.push(componentPage)
        }
        Button {
            height: 50
            text: qsTr("4. Loader")
            width: 100

            onClicked: stackView.push(loaderPage)
        }
        Button {
            height: 50
            text: qsTr("5. Image")
            width: 100

            onClicked: stackView.push(imagePage)
        }
        Button {
            height: 50
            text: qsTr("6. Text")
            width: 100

            onClicked: stackView.push(textPage)
        }
        Button {
            height: 50
            text: qsTr("7. Button")
            width: 100

            onClicked: stackView.push(buttonPage)
        }
        Button {
            height: 50
            text: qsTr("8. Row RowLayout")
            width: 100

            onClicked: stackView.push(rowLayoutPage)
        }
    }
}
