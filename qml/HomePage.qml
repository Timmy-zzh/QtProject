import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Text {
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("Welcome to QtProjectApp")
        }
        Button {
            text: qsTr("Go to Second Page")

            onClicked: stackView.push(secondPage)
        }
    }
}
