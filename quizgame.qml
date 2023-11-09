import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.12

Rectangle {
    width: 350
    height: 600
    color: "white"
    AnimatedImage {
                id: gifBackground1
                source: "qrc:/assets/bggif.gif" // Set the path to your GIF file
                anchors.fill: parent
    }


    Column {
        spacing: 10
        anchors.centerIn: parent

        Button {
            onClicked: {
                stackView.push("qrc:/pages/page1.qml") // Replace with the actual page for "C" questions
                console.log("Quiz type clicked")
            }
            text: "quiz type"
            width: 100
            height: 40

            background: Rectangle {
                radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#E0D2C7" }
                    GradientStop { position: 1.0; color: "#44B09E" }
                }
            }

            contentItem: Text {
                       text: parent.text
                       color: "white"
                       font.bold: true
                       font.pixelSize: 16
                       verticalAlignment: Text.AlignVCenter
                       horizontalAlignment: Text.AlignHCenter
                       anchors.fill: parent
                   }
        }

        Button {
            text: "settings"
            onClicked: {
                stackView.push("qrc:/settings.qml") // Replace with the actual page for "C" questions
                console.log("Settings clicked")
            }

            width: 100
            height: 40
            background: Rectangle {
                radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#E0D2C7" }
                    GradientStop { position: 1.0; color: "#44B09E" }
                }
            }
            contentItem: Text {
                       text: parent.text
                       color: "white"
                       font.bold: true
                       font.pixelSize: 16
                       verticalAlignment: Text.AlignVCenter
                       horizontalAlignment: Text.AlignHCenter
                       anchors.fill: parent
                   }
        }

        Button {
            text: "viewscore"
            width: 100
            height: 40
            background: Rectangle {
                radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#E0D2C7" }
                    GradientStop { position: 1.0; color: "#44B09E" }
                }
            }

                contentItem: Text {
                           text: parent.text
                           color: "white"
                           font.bold: true
                           font.pixelSize: 16
                           verticalAlignment: Text.AlignVCenter
                           horizontalAlignment: Text.AlignHCenter
                           anchors.fill: parent
                       }

        }
        Button {
            text: "Log Out"
            onClicked: {
                stackView.push("qrc:/DB/loginpage.qml") // Replace with the actual page for "C" questions
                console.log("Log Out clicked")
            }

            width: 100
            height: 40
            background: Rectangle {
                radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#E0D2C7" }
                    GradientStop { position: 1.0; color: "#44B09E" }
                }
            }
            contentItem: Text {
                       text: parent.text
                       color: "white"
                       font.bold: true
                       font.pixelSize: 16
                       verticalAlignment: Text.AlignVCenter
                       horizontalAlignment: Text.AlignHCenter
                       anchors.fill: parent
                   }
        }
    }
}

