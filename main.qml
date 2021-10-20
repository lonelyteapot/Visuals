import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0
import "components"

Window {
    id: root
    width: 824
    height: 420
    visible: true
    title: qsTr("Visuals")

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Sidebar {
            id: sidebar
            Layout.preferredWidth: Math.round(root.width * 0.25)
            Layout.minimumWidth: 128
            Layout.maximumWidth: 320
            Layout.fillHeight: true
        }

        Field {
            id: field
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
