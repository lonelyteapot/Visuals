import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Visuals")

    TableView {
        anchors.fill: parent

        model: _fieldModel
        delegate: Text {
            text: model.state
        }
    }
}
