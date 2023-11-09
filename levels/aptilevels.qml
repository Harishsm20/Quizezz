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

        Column {
            spacing: 10
            anchors.centerIn: parent

            Button {
                onClicked: {
                    stackView.push("qrc:/aptitude/aptieasy.qml") // Replace with the actual page for "C" questions
                    console.log("A easy clicked")
                }
                text: "Easy"
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
                onClicked: {
                    stackView.push("qrc:/aptitude/aptimedium.qml") // Replace with the actual page for "C" questions
                    console.log("a medium clicked")
                }
                text: "Medium"
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
                onClicked: {
                    stackView.push("qrc:/aptitude/aptihard.qml") // Replace with the actual page for "C" questions
                    console.log("a hard clicked")
                }
                text: "Hard"
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
                    stackView.push("qrc:/pages/page1.qml") // Replace with the actual page for "C" questions
                    console.log("Back clicked")
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
