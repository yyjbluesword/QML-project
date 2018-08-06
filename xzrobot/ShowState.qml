import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    id: robotInit;
    property string blueColor : "#57A0F7"
    property string grayColor : "gray"
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
            color: state ? blueColor : grayColor;
            property bool state: false;
            Canvas{
                width: 30;
                height: 30;
                anchors.top: parent.top;
                anchors.left: parent.left;
                onPaint: {
                    if(state){
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
    }
    Repeater{
        id: repeatCir;
        model: 5;
        Loader{
            sourceComponent: cirCom;
        }
    }
    Repeater{
        id: repeatLine;
        model: 4
        Rectangle{
            property bool state: false;
            width: 80;
            height: 5
            color: state? blueColor : grayColor;
        }
    }
    Repeater{
        id: repeatText;
        model: [qsTr("openRb"), qsTr("RdySta"), qsTr("RobAct"), qsTr("RelBrk"), qsTr("RobOp")];
        Text{
            color: "gray";
            text: modelData;
        }
    }

    Rectangle{
        id: buttonGroup;
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
    Component.onCompleted: {
        var cir = repeatCir.itemAt(0);
        var line = repeatLine.itemAt(0);
        var text = repeatText.itemAt(0);
        cir.anchors.left = title.left;
        cir.anchors.leftMargin = 50;
        cir.anchors.top = title.bottom;
        cir.anchors.topMargin = 15;
        line.anchors.left = cir.right;
        line.anchors.leftMargin = -1;
        line.anchors.verticalCenter = cir.verticalCenter;
        text.anchors.top = cir.bottom;
        text.anchors.topMargin = 5;
        text.anchors.left = cir.left;
        text.anchors.leftMargin = -5;
        for(var i=1; i < repeatCir.count; i++){
            repeatCir.itemAt(i).anchors.top = cir.top;
            repeatCir.itemAt(i).anchors.left = repeatLine.itemAt(i-1).right;
            repeatCir.itemAt(i).anchors.leftMargin = -1;
            if(i < repeatLine.count){
                repeatLine.itemAt(i).anchors.top = line.top;
                repeatLine.itemAt(i).anchors.left = repeatCir.itemAt(i).right;
                repeatLine.itemAt(i).anchors.leftMargin = -1;
            }
            repeatText.itemAt(i).anchors.top = text.top;
            repeatText.itemAt(i).anchors.left = repeatCir.itemAt(i).left;
            repeatText.itemAt(i).anchors.leftMargin = -5;
        }
        buttonGroup.anchors.top = text.bottom;
        for(var j = 0; j < repeatCir.count; j++){
            repeatCir.itemAt(j).state = false;
        }
    }
}
