import QtQuick 2.0

Rectangle{
    id: statusbar;
    color: "#FFFFFF";
    x:0;y:0;z:2;
    width: parent.width;
    height: 48;
    border.width: 1;
    border.color: "#CACCCE";
    Row{
        anchors.right: parent.right;
        anchors.verticalCenter: parent.verticalCenter;
        spacing: 10;
        Image{
            id: robotState;
            width: 48; height: 48;
            source:"images/state0.png";
        }
        Image{
            id: message;
            width: 48; height: 48;
            source:"images/warning2.png";
        }
        Image{
            id: robotMode;
            width: 48;height: 48;
            source:"images/a0.png";
        }
        Image{
            id: cycleMode;
            width: 48; height: 48;
            source:"images/c1.png";
        }
        Rectangle{
            width: 180;
            height: 48;
            color: "transparent";
            z:1;
            Text{
                id: curTime;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                text: "";
                font.pixelSize: 30;
                font.bold: true;
                color: "lightsteelblue";
            }
        }
        Image{
            id: menu
            width: 48;height:48;
            fillMode: Image.PreserveAspectFit
            source: "images/d1.png"
        }
    }
    Timer{
        id: time;
        interval: 60000; running: true;repeat: true;
        triggeredOnStart: true;
        onTriggered: {
            curTime.text = Qt.formatDateTime(new Date(),"MM-dd hh:mm");
        }
    }
}
