import QtQuick 2.2

Rectangle {
    id: colorPicker;
    width: 50;
    height: 30;
    Text{
        anchors.verticalCenter: parent.verticalCenter;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        text: qsTr("Robot Status");
    }
}
