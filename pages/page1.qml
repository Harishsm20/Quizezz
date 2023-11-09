import QtQuick 2.12
import QtQuick.Controls 2.12



    Rectangle {
        width: 350
        height: 600
        color: "white"
        AnimatedImage {
                    id: gifBackground
                    source: "qrc:/assets/bggif.gif" // Set the path to your GIF file
                    anchors.fill: parent
        }
        Text {
            text: "Welcome " + loginManager.getName(name.text) // Call getName with the name
            color: "white"
            font.bold: true
            font.pixelSize: 16
        }


        Column {


            spacing: 10
            anchors.centerIn: parent


            Button {
                onClicked: {
                    stackView.push("qrc:/levels/Clevels.qml") // Replace with the actual page for "C" questions
                    console.log("Technical clicked")
                }
                text: "Technical"
                width: 100
                height: 40

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
                text: "aptitude"
                onClicked: {
                    stackView.push("qrc:/levels/aptilevels.qml") // Replace with the actual page for "C" questions
                    console.log("aptitude clicked")
                }

                width: 100
                height: 40
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
                text: "verbal"
                onClicked: {
                    stackView.push("qrc:/levels/verblevels.qml") // Replace with the actual page for "C" questions
                    console.log("Verabl clicked")
                }
                width: 100
                height: 40
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
                text: "make a quiz"
                onClicked: {
                    stackView.push("qrc:/make_a_quiz.qml") // Replace with the actual page for "C" questions
                    console.log("make a quiz clicked")
                }

                width: 100
                height: 40
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
                text: "Back"
                onClicked: {
                    stackView.push("qrc:/pages/quizgame.qml") // Replace with the actual page for "C" questions
                    console.log("aptieasy clicked")
                }

                width: 100
                height: 40
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
    }

