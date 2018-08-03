import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    id: robotInit;
    property string blueColor : "#57A0F7"
    height: 100;
    Rectangle{
        id: title;
        width: parent.width; height: 30;
        anchors.left: parent.left;
        anchors.top: parent.top;
        color: "#EBEBEB"
        Text{
            anchors.verticalCenter: parent.verticalCenter;
            anchors.left: parent.left;
            anchors.leftMargin: 5;
            text: qsTr("Robot Status");
        }
    }
    Component{
        id: cirCom;
        Rectangle{
            width: 30;
            height: 30;
            radius: 15;
            color: blueColor;
            Canvas{
                width: 30;
                height: 30;
                anchors.top: parent.top;
                anchors.left: parent.left;
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.save();
                    ctx.strokeStyle = "white";
                    ctx.lineWidth = 2;
                    ctx.beginPath();
                    ctx.moveTo(7,17);
                    ctx.lineTo(12,22);
                    ctx.lineTo(22,7);
                    ctx.stroke();
                    ctx.restore();
                }
            }
        }
    }
    Row{
        id: rowTest;
        anchors.top: title.bottom;
        anchors.left: parent.left;
    }

    Loader{
        id:openState;
        anchors.top: rowTest.bottom;
        anchors.bottomMargin: 10;
        anchors.left: parent.left;
        anchors.leftMargin: 50;
        sourceComponent: cirCom;
    }

    Rectangle{
        id:line1;
        anchors.left: openState.right;
        anchors.leftMargin: -1;
        anchors.verticalCenter: openState.verticalCenter;
        width:80;
        height:5;
        color: blueColor
    }
    Loader{
        id: readyStart;
        anchors{left: line1.right; leftMargin: -1; verticalCenter: openState.verticalCenter;}
        sourceComponent: cirCom;
    }
    Rectangle{
        id: line2;
        anchors.left: readyStart.right;
        anchors.leftMargin: -1;
        anchors.verticalCenter: openState.verticalCenter;
        width: 80;
        height: 5;
        color: blueColor;
    }

    Loader{
        id: robotActive;
        anchors{left: line2.right; leftMargin: -1; verticalCenter: openState.verticalCenter;}
        sourceComponent: cirCom;
    }
    Rectangle{
        id: line3;
        anchors.left: robotActive.right;
        anchors.leftMargin: -1;
        anchors.verticalCenter: openState.verticalCenter;
        width: 80;
        height: 5;
        color: blueColor;
    }
    Loader{
        id: releaveBreak;
        anchors{left: line3.right; leftMargin: -1; verticalCenter: openState.verticalCenter;}
        sourceComponent: cirCom;
    }
    Rectangle{
        id: line4;
        anchors.left: releaveBreak.right;
        anchors.leftMargin: -1;
        anchors.verticalCenter:openState.verticalCenter;
        width: 80;
        height: 5;
        color: blueColor;
    }
    Loader{
        id: robotOperate;
        anchors{left: line4.right; leftMargin: -1; verticalCenter: openState.verticalCenter;}
        sourceComponent: cirCom;
    }

    Text{
        id:openStateText;
        text: "open"
        anchors.top: openState.bottom;
        anchors.topMargin: 5;
        anchors.left: openState.left;
        anchors.leftMargin: -5;
    }
    Text{
        id: readyStartText;
        text: "ReadyStart";
        anchors.top: readyStart.bottom;
        anchors.topMargin: 5;
        anchors.left: readyStart.left;
        anchors.leftMargin: -5;
    }
    Text{
        id: robotActiveText;
        text: "RobotAct";
        anchors.top: robotActive.bottom;
        anchors.topMargin: 5;
        anchors.left: robotActive.left;
        anchors.leftMargin: -5;
    }
    Text{
        id: releaveBreakText;
        text: "ReleaveBrk";
        anchors.top: releaveBreak.bottom;
        anchors.topMargin: 5;
        anchors.left: releaveBreak.left;
        anchors.leftMargin: -5;
    }
    Text{
        id: robotOperateText;
        text: "RobotOp";
        anchors.top: robotOperate.bottom;
        anchors.topMargin: 5;
        anchors.left: robotOperate.left;
        anchors.leftMargin: -5;
    }
    Rectangle{
        id: buttonGroup;
        anchors.top: openStateText.bottom;
        anchors.topMargin: 10;
        anchors.left: parent.left;
        anchors.leftMargin: 200;
        Button{
            id: start
            text: qsTr("Start");
            width: 80;height: 25;
            style: ButtonStyle{
                background: Rectangle{
                    width: parent.width;
                    height: parent.height;
                    color: blueColor;
                }
            }
        }
        Button{
            anchors.left: start.right;
            anchors.leftMargin: 10;
            id: stop
            text: qsTr("Stop");
            width: 80; height: 25;
            style: ButtonStyle{
                background: Rectangle{
                    width: parent.width;
                    height: parent.height;
                    color: "#FF5657"
                }
            }
        }
    }
    Rectangle{
        id: msg;
        anchors.top: buttonGroup.bottom;
        anchors.topMargin: 30;
        anchors.left: parent.left;
        anchors.leftMargin: 120;
        Image{
            id: tipImage;
            anchors.top: parent.top;
            anchors.left: parent.left;
            width: 48; height: 48;
            source: "images/warning0.png";
        }
        Text{
            anchors.left: tipImage.right;
            anchors.leftMargin: 10;
            anchors.verticalCenter: tipImage.verticalCenter;
            color: "#FF5657";
            text: qsTr("Warning! Please keep the distance from the robot!");
        }
    }
}
