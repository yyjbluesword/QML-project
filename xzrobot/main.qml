import QtQuick 2.9
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1024
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
                        Rectangle{
                            width:20;height:20;
                            color:"#57A0F7";
                        }
                        Text{
                            text: "Init";
                        }

                    }
                    GroupBox{
                        id: init;
                        //title: qsTr("Init");
                        width: 600; height: 180;
                        Column{
                            spacing: 10;
                            TextField{
                                style:TextFieldStyle{
                                    textColor: "black";
                                    background: Rectangle{
                                        radius: 2;
                                        implicitHeight: 24;
                                        implicitWidth: 100;
                                        border.color: "#333";
                                        border.width: 1;
                                    }
                                }
                            }
                            TextField{

                            }
                            TextArea{
                                id:textview;
                                //anchors.fill: parent;
                                wrapMode: TextEdit.WordWrap;
                                style: TextAreaStyle{
                                    backgroundColor: "black";
                                    textColor: "green";
                                    selectionColor: "steelblue";
                                    selectedTextColor: "#A00000";
                                }
                            }
                        }
                    }
                    GroupBox{
                        id: selectJbi;
                        //title: qsTr("selectJbi");
                        width: 600;height: 180;
                        CheckBox{
                            text: "open";
                            checked: true;
                        }
                    }
                    GroupBox{
                        id: monitor;
                        //title: qsTr("monitor");
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
