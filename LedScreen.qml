import QtQuick 2.0

Item {
    id: root

    //anchors.fill: parent

    property alias text: screen_text.text

    Image {
        anchors.fill: parent
        source: "qrc:/img/LedScreen.png"

        Text {
            id: screen_text
            anchors {
                fill: parent
                leftMargin: 5
                rightMargin: 5
            }
            z: 3

            color: "#111111"
            font.pointSize: (parent.height === 0) ? 10 : parent.height * 0.6
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
        }
    }



}
