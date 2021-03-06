/*
Copyright (c) <2013>, Jolla Ltd.
Contact: Vesa-Matti Hartikainen <vesa-matti.hartikainen@jollamobile.com>

All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer. Redistributions in binary
    form must reproduce the above copyright notice, this list of conditions and
    the following disclaimer in the documentation and/or other materials
    provided with the distribution. Neither the name of the Jolla Ltd. nor
    the names of its contributors may be used to endorse or promote products
    derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import QtDocGallery 5.0
import org.nemomobile.thumbnailer 1.0

Page {
    DocumentGalleryModel {
        id: galleryModel
        rootType: DocumentGallery.Image
        properties: [ "url", "title", "dateTaken" ]
        autoUpdate: true
        sortProperties: ["dateTaken"]
    }


    // Gridview with Sailfish Silica specific
    SilicaGridView {
        id: grid
        header: PageHeader { title: "How many nights?" }
        cellWidth: width / 2
        cellHeight: width / 2
        anchors.fill: parent
        model: galleryModel

        // Sailfish Silica PulleyMenu on top of the grid
        PullDownMenu {
            MenuItem {
                text: "Latest first"
                onClicked: galleryModel.sortProperties = [ "-dateTaken" ]
            }
            MenuItem {
                text: "Oldest first"
                onClicked: galleryModel.sortProperties = [ "dateTaken" ]
            }
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("Tietoja.qml"))
            }
            MenuItem {
                text: qsTr("New event")
                onClicked: pageStack.push(Qt.resolvedUrl("Uusitapahtuma.qml"))
            }
        }

        delegate: Image {
//            delegate: Text {
            asynchronous: true

            // From org.nemomobile.thumbnailer
            source:  "image://nemoThumbnail/" + url
//            source:  "home/nemo/Pictures/montakoyota" + url //Not working

            sourceSize.width: grid.cellWidth
            sourceSize.height: grid.cellHeight

            Text {
                font.bold: true
                style: Text.Raised
                text : "Birthday \n" + 5 + " " + qsTr("nights")
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

            MouseArea {
                anchors.fill: parent
                onClicked: window.pageStack.push(Qt.resolvedUrl("Tapahtuma.qml"),
                                                 {currentIndex: index, model: grid.model} )
            }
        }
        ScrollDecorator {}
    }
}

