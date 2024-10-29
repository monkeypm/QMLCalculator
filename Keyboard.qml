import QtQuick 2.12
import QtQuick.Layouts 1.3

Item {
    id: root
    focus: true

    signal keyPressed(string key)

    ColumnLayout {
        id: lay_column
        readonly property variant captions: ["7", "8", "9", "+", "\u232b", "4", "5", "6", "-", "C", "1", "2", "3", "*", "(", "0", ".", "=", "/", ")"]
        readonly property int rowsKbd: 4
        readonly property int colsKbd: 5

        anchors {
            leftMargin: 5
            rightMargin: 5
            topMargin: 5
            bottomMargin: 10
        }

        anchors.fill: parent
        spacing: 0

        Repeater {
            model: lay_column.rowsKbd
            RowLayout {
                id: row
                property int row_index: index
                Repeater {
                    model: lay_column.colsKbd
                    ButtonBlue {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        text: lay_column.captions[row.row_index * lay_column.colsKbd + index].toString()
                        onClicked: ()=>{ keyPressed( lay_column.captions[row.row_index * lay_column.colsKbd + index].toString() ) }
                    }
                }
            }
        }
    }

    Keys.onPressed: (event)=> {
        if (event.key >= Qt.Key_0 && event.key <= Qt.Key_9)
            keyPressed( event.key-Qt.Key_0 )
        else if ((event.key === Qt.Key_Comma) || (event.key === Qt.Key_Period))
            keyPressed( "." )
        else if (event.key === Qt.Key_Slash)
            keyPressed( "/" )
        else if (event.key === Qt.Key_Asterisk)
            keyPressed( "*" )
        else if (event.key === Qt.Key_Minus)
            keyPressed( "-" )
        else if (event.key === Qt.Key_Plus)
            keyPressed( "+" )
        else if (event.key === Qt.Key_Return)
            keyPressed( "=" )
        else if (event.key === Qt.Key_ParenLeft)
            keyPressed( "(" )
        else if (event.key === Qt.Key_ParenRight)
            keyPressed( ")" )
        else if (event.key === Qt.Key_Backspace)
            keyPressed( "\u232b" )
        else if (event.key === Qt.Key_Escape)
            keyPressed( "C" )

    }
}

