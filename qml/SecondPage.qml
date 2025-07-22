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
            text: qsTr("This is the Second Page")
        }
        Button {
            text: qsTr("Go Back")

            onClicked: stackView.pop()
        }
    }
}
