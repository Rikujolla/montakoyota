/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
//import QtQuick.Dialogs 1.0


Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
            MenuItem {
                text: qsTr("Kuvasivu")
                onClicked: pageStack.push(Qt.resolvedUrl("Kuvasivu.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Event Design")
            }
/*            Label {
                x: Theme.paddingLarge
                text: eventname + " " + paivitys.milseks + " " + paivitys.ero;
                color: colorvalue
            } */

            Item {
                id: paivitys
                property int paiva : 2;
//                property int paivat : 5;
                property int milseks;
                property double ero : 21;
//                property date testos;
                function countNights(){
            // How many dates count
                var today = new Date();
                    // The day changes at 6 am, so need to subtract 6*60*60*1000
                    ero = (button.tiikro.getTime()-today.getTime()-6*60*60*1000)/(1000*60*60*24);
                    milseks = Math.ceil(ero);

                }
            }

//            Timer {
//                interval: 200
//                running: Qt.ApplicationActive
//                repeat: false
//                onTriggered: paivitys.countNights()
//            }

//Image {
//    source:"1.png"
//}

            Rectangle{
//            Image {
                width: 270
                height:270
//                source: "aa.png"
                anchors.horizontalCenter: parent.horizontalCenter
//                delegate: Image {
//                source: '/home/nemo/Pictures/montakoyota/1.png'
/*                fillMode: Image.PreserveAspectFit
                sourceSize.height: window.height * 2
                asynchronous: true
                anchors.fill: parent

                PinchArea {
                    anchors.fill: parent
                    pinch.target: parent
                    pinch.minimumScale: 1
                    pinch.maximumScale: 4
                } */
//                }
//                delegate: Image {
//                    source: "1.png"
//                }

                Text {
                    font.bold: true
                    style: Text.Raised
                    text : eventname + "\n" + paivitys.milseks + " " + qsTr("nights")
                    color: colorvalue
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
    //                Label {text: "hoo"}
    //                horizontalAlignment: Text.AlignHCenter
    //                verticalAlignment: Text.AlignVCenter
    //                anchors.horizontalCenterOffset: 1;
    //                anchors.verticalCenterOffset: 1;
                    //                color: ColorAnimation { from: "white"; to: "black"; duration: 200 }
                }
//                }
            }

            TextField {
                id: event
                width: page.width
                placeholderText: qsTr("Enter event")
//                placeholderText: eventname
                label: qsTr("Event name")
                EnterKey.enabled: text.length > 0
                EnterKey.onClicked: eventname = text

            }

/*            Rectangle {
                id: colorIndicator
                color: "transparent"
                width: 30
                height: 30
                //                width: theme.itemSizeSmall
//                height: theme.itemSizeSmall
            } */

            Button {
                id: button2
                text: "Choose text color"

                onClicked: {
                    var dialog2 = pageStack.push("Sailfish.Silica.ColorPickerDialog")
                    dialog2.accepted.connect(function() {
//                        colorIndicator.color = dialog2.color;
                        colorvalue = dialog2.color
                    })
                }
            }

/*            Button {
                text: qsTr("Update")
                onClicked: {paivitys.countNights()
                }
            } */


//            DatePicker {
//                id : pikkeri
/*                property int year: 2015
                property int month: 3
                property int day: 2
                date: new Date(2015, 2, 23, 12, 0, 0) // 10 = November, JavaScript date objects have 0-based month
                onClicked: pikkeri.date = new Date(year, month-1, day, 12, 0, 0)   // set the selected date

                Component.onCompleted: console.log(month) */
//            }

            Button {
                id: button
                property date tiikro;
                text: "Choose a date"

                onClicked: {
                    var dialog = pageStack.push(pickerComponent, {
                        date: new Date('2015/06/26') // Jun 26 2015
//                        date: new Date(2015, 1, 4, 8, 0, 0) // Feb 04 2015
                    })
                    dialog.accepted.connect(function() {
                        button.text = "You chose: " + dialog.dateText;
                        button.tiikro = dialog.date;
                        paivitys.countNights()
                    })
                }

                Component {
                    id: pickerComponent
                    DatePickerDialog {}
                }
            }
/*// Opening the picture file, not working in SailfishOS
            FileDialog {
                id: fileDialog
                title: "Please choose a file"
                onAccepted: {
                    console.log("You chose: " + fileDialog.fileUrls)
                    Qt.quit()
                }
                onRejected: {
                    console.log("Canceled")
                    Qt.quit()
                }
                Component.onCompleted: visible = true
            }

// End of picture file dialog */

/*// Start dialoki // Not working
            Dialog {
                property string name

                Column {
                    width: parent.width

                    DialogHeader { }
                    TextField {
                        id: nameField
                        width: 480
                        placeholderText: "Path"
                    }
                }

                onDone: {
                    if (result == DialogResult.Accepted) {
                        name = nameField.text
                    }
                }
            }

// Dialoki */


        }
    }
}


