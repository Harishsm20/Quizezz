

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Rectangle {
    Column {
        y: 230
        Repeater {
            model: userResponses.length
            Text {
                text: {
                    if (userResponses[index] === 0) {
                        return("Question " + (index + 1) + ": " +  "Wrong");
                    } else if (userResponses[index] === 1) {
                        return("Question " + (index + 1) + ": " +  "Correct");
                    } else {
                        return ("Question " + (index + 1) + ": " +  "Not Attended");
                    }
                }
                color: {
                    if (userResponses[index] === 0) {
                        return "red";
                    } else if (userResponses[index] === 1) {
                        return "green";
                    } else {
                        return "black";
                    }
                }
            }
        }
        Button {
            y: 260
            text: "Home"
            anchors.horizontalCenterOffset: 8
            onClicked: {
                stackView.push("qrc:/pages/page1.qml")
            }
            width: 160
            height: 53
            visible: true
            anchors.horizontalCenter: parent.horizontalCenter

            background: Rectangle {
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#E0D2C7" }
                    GradientStop { position: 1.0; color: "#44B09E" }
                }
                radius: 10
            }
        }
    }
}
