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

    Item {
        id: colors
        readonly property color sidebar_bg: "#FFECCC"
        readonly property color field_bg: "#FFF8EB"
        readonly property color cell_empty: "#6A6B83"
        readonly property color cell_wall: "#533747"
        readonly property color cell_target: "#D33F49"
        readonly property color cell_visited: "green"
    }

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
