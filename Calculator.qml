import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {

    property alias expr: screen.text
    signal expressionChanged(string expr)

    ColumnLayout {
        anchors.fill: parent

        LedScreen {
            id: screen
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.2
        }

        Keyboard {
            id: keyboard
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.8
            onKeyPressed: (key) => {
                handleKey(key)
            }
        }

    }

    function handleKey(key) {
        let expr_test = expr
        if (key === "C")
            expr_test = ""
        else if (key === "\u232b")
            expr_test = expr_test.slice(0, -1)
        else if (key === "=") {
            expr_test = app.calculateExpr(expr_test)
        }
        else
            expr_test = expr + key
        expr = expr_test
        screen.text = expr
    }
}
