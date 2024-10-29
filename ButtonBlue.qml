import QtQuick 2.2

Item {
    id: root

    property int minHeight: 26
    property alias text: caption.text

    signal clicked()

    readonly property int mouse_over_delay_ms: 200

    BorderImage {
        id: background
        anchors.fill: parent
        source: "qrc:/img/ButtonOff.png"
        border {
            top: sourceSize.height/ 2 - 1
            bottom: sourceSize.height / 2 - 1
            left: sourceSize.width / 2 - 1
            right: sourceSize.width / 2 - 1
        }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
    }

    BorderImage {
        id: button_on
        anchors.fill: parent
        source: "qrc:/img/ButtonBlue.png"
        opacity: 0.0
        border {
            top: sourceSize.height/ 2 - 1
            bottom: sourceSize.height / 2 - 1
            left: sourceSize.width / 2 - 1
            right: sourceSize.width / 2 - 1
        }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
    }

    Text {
        id: caption
        anchors.fill: parent
        font.pointSize: (parent.height === 0) ? 10 : parent.height * 0.4
        color: "#eeeeee"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: { root.clicked() }
        onEntered: { button_on.opacity = 1.0 }
        onExited: { animator.start() }

        OpacityAnimator {
            id: animator
            target: button_on;
            from: 1;
            to: 0;
            duration: root.mouse_over_delay_ms
        }
    }



}
