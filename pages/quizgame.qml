import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.12

Rectangle {
    width: 350
    height: 600
    color: "white"
    property string username: ""
    AnimatedImage {
        id: gifBackground
        source: "qrc:/assets/bggif.gif" // Set the path to your GIF file
        anchors.fill: parent
    }

    Text {
        x: 100
        y: 100
        id: usernamelabel
        text: "Welcome, " + username
        color: "white"
        font.bold: true
        font.pixelSize: 16
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
    }



        Button {
            onClicked: {
                stackView.push("qrc:/pages/page1.qml") // Replace with the actual page for "C" questions
                console.log("Quiz type clicked")
            }
            text: "quiz type"
            width: 100
            height: 40
            x:110
            y:100

            background: Rectangle {
                radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#1B3487" }
                    GradientStop { position: 1.0; color: "#141C61" }
                    GradientStop { position: 1.0; color: "#08013C" }
                    GradientStop { position: 1.0; color: "#58063D" }
                    GradientStop { position: 1.0; color: "#911C33" }
                    GradientStop { position: 1.0; color: "#BA2D23" }
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
            x:110
            y:150
            background: Rectangle {
                radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#1B3487" }
                    GradientStop { position: 1.0; color: "#141C61" }
                    GradientStop { position: 1.0; color: "#08013C" }
                    GradientStop { position: 1.0; color: "#58063D" }
                    GradientStop { position: 1.0; color: "#911C33" }
                    GradientStop { position: 1.0; color: "#BA2D23" }
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
            x:110
            y:200
            onClicked: {
                stackView.push("qrc:/highscore.qml") // Replace with the actual page for "C" questions
                console.log("High Score clicked")
            }
            background: Rectangle {
                radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#1B3487" }
                    GradientStop { position: 1.0; color: "#141C61" }
                    GradientStop { position: 1.0; color: "#08013C" }
                    GradientStop { position: 1.0; color: "#58063D" }
                    GradientStop { position: 1.0; color: "#911C33" }
                    GradientStop { position: 1.0; color: "#BA2D23" }
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
            x:110
            y:250
            background: Rectangle {
                radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#1B3487" }
                    GradientStop { position: 1.0; color: "#141C61" }
                    GradientStop { position: 1.0; color: "#08013C" }
                    GradientStop { position: 1.0; color: "#58063D" }
                    GradientStop { position: 1.0; color: "#911C33" }
                    GradientStop { position: 1.0; color: "#BA2D23" }
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

