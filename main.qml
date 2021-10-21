import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0
import "components"

Window {
    id: root
    width: 768
    height: 512
    minimumWidth: 512
    minimumHeight: 256
    visible: true
    title: qsTr("Visuals")

    Item {
        id: colors
        readonly property color sidebar_bg: "#272D2D"
        readonly property color field_bg: "#D6D6D6"
        readonly property color cell_empty: "#F6F8FF"
        readonly property color cell_wall: "#272D2D"
        readonly property color cell_target: "#D33F49"
        readonly property color cell_visited: "green"
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Sidebar {
            id: sidebar
            Layout.preferredWidth: 256
            Layout.fillHeight: true
        }

        Field {
            id: field
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
