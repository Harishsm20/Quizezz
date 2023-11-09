import QtQuick 2.12
import QtQuick.Controls 2.12
import com.example.login 1.0
import QtMultimedia 5.12


Rectangle {
    id: window
    width: 350
    height: 600
    AnimatedImage {
                id: gifBackground
                source: "qrc:/assets/intro.gif.crdownload" // Set the path to your GIF file
                anchors.fill: parent
    }







        Button {
            onClicked: {
            stackView.push("qrc:/DB/loginpage.qml")
                audioElement.stop();
            }
            text: "Enter"
            x:125;
            y: 450;
            contentItem: Text {
                       text: parent.text
                       color: "white"
                       font.bold: true
                       font.pixelSize: 16
                       verticalAlignment: Text.AlignVCenter
                       horizontalAlignment: Text.AlignHCenter
                       anchors.fill: parent
                   }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "transparent"
                radius: 4
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#000000" : "#000000" }
                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                }

            }
        }
        Audio {
               id: audioElement
               source: "qrc:/assets/background1.mp3"
               // Replace with the path to your audio file
               autoPlay: true
           }

        }



