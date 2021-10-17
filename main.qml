import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0

Window {
    width: 824
    height: 404
    visible: true
    title: qsTr("Visuals")

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Sidebar {
            Layout.preferredWidth: 220
            Layout.fillHeight: true
        }

        Field {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
