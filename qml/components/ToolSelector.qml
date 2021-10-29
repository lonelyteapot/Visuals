import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle {
    implicitHeight: text.height + row.height + 6

    readonly property int cellSize: 26
    readonly property int selectedCellSize: 30

    Text {
        id: text
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            margins: 2
        }
        text: "Tool selection"
        font.pixelSize: 16
    }

    Rectangle {
        id: row
        anchors {
            top: text.bottom
            left: parent.left
            right: parent.right
            margins: 2
        }
        implicitHeight: selectedCellSize + 12
        radius: 5
        color: colors.cell_wall

        RowLayout {
            id: row_layout
            anchors {
                fill: parent
                leftMargin: 6
                rightMargin: 6
            }
            spacing: 0

            Repeater {
                id: repeater
                model: ListModel {
                    ListElement { state: 1 }
                    ListElement { state: 2 }
                    ListElement { state: 3 }
                    ListElement { state: 0 }
                }
                delegate: MouseArea {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: field.drawingResult = model.state

                    Cell {
                        readonly property bool isSelected: field.drawingResult === model.state

                        anchors.centerIn: parent
                        width: isSelected ? selectedCellSize : cellSize
                        height: width
                        radius: isSelected ? 6 : 3
                        border.color: colors.field_bg
                        border.width: 2
                    }
                }
            }
        }
    }
}
