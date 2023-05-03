import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

import QtMultimedia

Window {
    id: mainWindow
    visible: true
    width: 960
    height: 540
    title: "QML"


//    Rectangle {
//            id: videoContainer
//            anchors.fill: parent
//            visible: false
//            MediaPlayer {
//                id: mediaPlayer

//                source: "qrc:/button/IMG_4692 2.mov"
//            }
//            VideoOutput {
//                id: videoOutput
//                source: mediaPlayer
//                anchors.fill: parent
//            }
//        }


    Rectangle {
            id: background
            width: mainWindow.width
            height: mainWindow.height

            Image {
                x: 0
                y: 0
                width: mainWindow.width
                height: mainWindow.height
                source: "qrc:/button/d205d79a4c12427ad7185a8daaaea249.jpg"
                fillMode: Image.PreserveAspectFit
//                fillMode: Image.Stretch
            }
        }

    property int elapsedTime: 0

    Rectangle {
        id: timer_background
        color: "#303030"
        x: 420
//        y: 467
        y: mainWindow.height * 6/7


        Text {
            id: timeText
            text: formatElapsedTime(0)
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 24
        }

        width: 170
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

    Image {
        id: iMG_4708
        x: 203
//        y: 451
        y: mainWindow.height * 5/6
        width: 66
        height: 62
        visible: true
        //        source: "button/IMG_4708.PNG"
        source: "../button/IMG_4708.PNG"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: iMG_4709
        x: 877
//        y: 450
        y: mainWindow.height * 5/6
        width: 69
        height: 62
        source: "../button/IMG_4709.PNG"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: iMG_4707
        x: 295
//        y: 451
        y: mainWindow.height * 5/6
        width: 61
        height: 62
        source: "../button/IMG_4707.PNG"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: battery
        x: 827
//        y: 461
        y: mainWindow.height * 0.85
        width: 35
        height: 40
        source: "../button/Battery.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: lumawaveform
        x: 674
//        y: 436
        y: mainWindow.height * 4/5
        width: 126
        height: 90
        source: "../button/lumawaveform.PNG"
        fillMode: Image.PreserveAspectFit
    }

    Video {
        id: v
        height:mainWindow.height
        width:mainWindow.width
        anchors.horizontalCenter: mainWindow.horizontalCenter
        source: "../button/IMG_4692 2.mov"
    }

    Button {
        id: play
        x: 107
//        y: 451
        y: mainWindow.height * 5/6
        width: 66
        height: 62
        background: null
        Image {
            anchors.fill: parent;
            source: "../button/play.png"
            fillMode: Image.PreserveAspectFit
        }
        onClicked: {
//                    videoContainer.visible = true
//                    mediaPlayer.play()
            v.play()
                    console.log("play")
                }

    }

    Image {
        id: stop
        x: 20
//        y: 451
        y: mainWindow.height * 5/6
        width: 64
        height: 61
        source: "../button/stop.png"
        fillMode: Image.PreserveAspectFit
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
