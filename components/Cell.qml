import QtQuick 2.15
import QtQuick.Layouts 1.0

Rectangle {
    radius: 2
    // EMPTY, WALL, TARGET, VISITED
    color: ["#6A6B83", "#533747", "#D33F49", "green"][model.state]

    Text {
        anchors.centerIn: parent
        text: model.state
        font.pixelSize: 14
        visible: false
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onEntered: model.state = field.drawingResult
        hoverEnabled: field.drawingEnabled
        onPressed: (mouseEvent) => {
            if (field.drawingEnabled) {
                field.drawingEnabled = false;
            } else {
                // Hovering on other cells doen't work if the event is accepted
                mouseEvent.accepted = false;
                field.drawingResult = mouseEvent.button === Qt.LeftButton;
                field.drawingEnabled = true;
                onEntered();
            }
        }
    }
}
