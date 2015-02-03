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


Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
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
                title: qsTr("UI Template")
            }
            Label {
                x: Theme.paddingLarge
                text: qsTr("Birthday") + " " + paivitys.milseks + " " + paivitys.ero;
                color: Theme.secondaryHighlightColor
//                font.pixelSize: Theme.fontSizeExtraLarge
            }

            Item {
                id: paivitys
                property int paiva : 2;
                property int paivat : 5;
                property int milseks;
                property double ero : 21;
                property date testos;
                function countNights(){
            // How many dates count
                var today = new Date();
//                paiva = today.prototype.getDate();
//                    paiva = today.getDate();
//                    paiva = today.getDate();
//                    testos = button.tiikro;
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

            Button {
                text: qsTr("Update")
                onClicked: {paivitys.countNights()
                }
            }


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
                        date: new Date('2015/02/04') // Feb 04 2015
//                        date: new Date(2015, 1, 4, 8, 0, 0) // Feb 04 2015
                    })
                    dialog.accepted.connect(function() {
                        button.text = "You chose: " + dialog.dateText;
                        button.tiikro = dialog.date
                    })
                }

                Component {
                    id: pickerComponent
                    DatePickerDialog {}
                }
            }






        }
    }
}


