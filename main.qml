import QtQuick 2.2
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

Window {
    width: 640
    height: 640
    visible: true
    title: qsTr("Calculator")

    Calculator {
        id: calculatorEngine
        anchors.fill: parent
    }

    MessageDialog {
        id: errorMessage
        text: ""
        visible: false
    }

    function onError(description) {
        errorMessage.text = description
        errorMessage.visible = true
    }

    Component.onCompleted: {
        app.error.connect(onError)
    }

}

