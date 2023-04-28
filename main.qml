import QtQuick 2.15

import QtQuick.Window 2.15
import QtQuick.Controls 6.3
import Qt.test.controls 6.0
import QtQuick.Controls.Windows 6.0
import QtQuick.Layouts 6.3
import QtMultimedia 5.0


Window{
    id: window
    visible: true
    width: 900
    height: 680
    title: qsTr("Home Page")

    ColumnLayout{
        x: 0
        y: 23
        anchors.left: parent.left
        Video {
            id: video
            width : 600
            height : 600
            source: "../../Desktop/vedio"

            Image {
                id: image2
                x: 290
                y: 458
                width: 30
                height: 42
                source: "../../Desktop/Stop.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: image3
                x: 363
                y: 458
                width: 34
                height: 42
                source: "../../Desktop/Battery.png"
                fillMode: Image.PreserveAspectFit

            }

            Image {
                id: image1
                x: 200
                y: 360
                width: 34
                height: 38
                source: "../../Desktop/Play.png"
                fillMode: Image.PreserveAspectFit
            }
        }
         RowLayout{


            Button {
                id: button
                width: 40
                height: 40
                text: "play"
                autoRepeatDelay: 300
                onClicked: {video.play()}
                background: Image {
                        source: "../../Desktop/Play.png"
                        fillMode: Image.PreserveAspectFit
                    }
            }
            Button {
                width: 40
                height: 40
                text: "stop"
                onClicked: {video.stop()}
                background: Image {

                        source: "../../Desktop/Stop.png"
                        fillMode: Image.PreserveAspectFit
                    }


            }


                Button {
                    id: myButton
                    width: 40
                    height: 40
                    text: "battery"
                    background: Image {
                        source:  "../../Desktop/Battery.png"
                        fillMode: Image.PreserveAspectFit
                    }

                }


            Button {
                width: 40
                height: 40
                text: "foward"
                onClicked: {video.foward()}
                background: Image {
                    source:  "../../Desktop/Tag.png"
                    fillMode: Image.PreserveAspectFit
                }
                contentItem: Text {
                       text: "tag"
                       font.bold: true
                       font.pointSize: 12
                       color: "grey"
                   }



            }
            Button {
                width: 80
                height: 80
                text: "back"
                onClicked: {video.back()}
            }
         }
    }

    Image {
        id: image
        x: 67
        y: 102
        width: 42
        height: 52
        source: "../../Desktop/Tag.png"
        fillMode: Image.PreserveAspectFit
    }

    property int elapsedTime: 0

    Rectangle {
        id: background
        color: "#303030"
        x: 800
        y: 900


        Text {
            id: timeText
            text: formatElapsedTime(0)
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 24
        }

        width: timeText.paintedWidth
        height: timeText.paintedHeight


    }

    Timer {
        id: timer
        interval: 1
        running: true
        repeat: true

        onTriggered: {
            elapsedTime += 1
            timeText.text = formatElapsedTime(elapsedTime)
        }
    }

    function formatElapsedTime(ms) {
        var hours = Math.floor(ms / 3600000)
        var minutes = Math.floor((ms % 3600000) / 60000)
        var seconds = Math.floor((ms % 60000) / 1000)
        var milliseconds = ms % 1000

        return pad(hours) + ':' + pad(minutes) + ':' + pad(seconds) + ':' + pad(milliseconds, 3)
    }

    function pad(number, digits = 2) {
        return String(number).padStart(digits, '0')
    }
}
