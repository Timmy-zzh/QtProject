import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    Component {
        id: itemPage

        ItemPage {
        }
    }
    Component {
        id: rectanglePage

        RectanglePage {
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
