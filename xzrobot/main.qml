import QtQuick 2.9
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1000
    height: 600
    title: qsTr("XZ transferRob")
    Item{
        width: parent.width; height: parent.height;
        anchors.centerIn: parent;
        MyStatusBar{id: stabar}
        FocusScope{
            id: mainfrm;
            anchors.top: stabar.bottom;
            anchors.topMargin: 10;
            height: parent.height - stabar.height;
            width: parent.width;
            focus: true;
            Row{
                spacing: 10;
                Image{
                    id: sim3D;
                    source:"images/3Ddemo.png";
                }
                Column{
                    Row{
                        spacing: 5;
                        Rectangle{
                            width:20;height:20;
                            radius: 5;
                            color:"#57A0F7";
                        }
                        Text{
                            text: "Init";
                        }

                    }
                    GroupBox{
                        id: init;
                        width: 600; height: 200;
                        Loader{
                            id: showState;
                            width: 550;
                            //height: 180;
                            source:"ShowState.qml";
                            onLoaded: {
                                item.color = "#FFFFFF";
                            }
                        }
                    }
                    GroupBox{
                        id: selectJbi;
                        width: 600;height: 180;
                        CheckBox{
                            text: "open";
                            checked: true;
                        }
                    }
                    GroupBox{
                        id: monitor;
                        width: 600;height: 180;
                        CheckBox{
                            text: "open";
                            checked: true;
                        }
                    }
                }
            }
        }
    }
}
