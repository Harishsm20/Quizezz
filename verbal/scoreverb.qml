
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.12


Rectangle {
    property int elapsedTime: 0 // Define the property here
    property var userResponses: []

    Image {

        source: "qrc:/bg1.jpg"
    }

    id: scorePage
    width: parent.width
    height: parent.height
    AnimatedImage {
                id: gifBackground
                source: "qrc:/assets/celebration.gif" // Set the path to your GIF file
                anchors.fill: parent
                 // Set the number of loops (infinite in this case)

                Timer {
                            id: gifTimer
                            interval: 2000 // 5000 milliseconds = 5 seconds
                            running: false

                            onTriggered: {
                                gifTimer.stop(); // Stop the timer when it triggers
                                gifBackground.visible = false; // Hide the GIF after 5 seconds
                            }
                        }
    }

                        Component.onCompleted: {
                            gifTimer.start(); // Start the timer when the QML component is completed
                        }


    // Receive the score as a property
    property int score: 0

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#42275A" }
        GradientStop { position: 1.0; color: "#734B6D" }
    }



        Text {
            x:95;
            y:150
            text: "Quiz Complete!"
            font.pixelSize: 24
            color: "white"
        }

        Text {
            x:95
            y:190
            // Display the received score
            text: "Your Final Score: " + score
            font.pixelSize: 18
            color: "white"
        }


    Button {
        y: 260
        text: "Restart Quiz"
        anchors.horizontalCenterOffset: 8
        onClicked: {

            // Handle "C" button click
            stackView.push("qrc:/levels/aptilevels.qml") // Replace with the actual page for "C" questions
            console.log("t level clicked")
            audioElement.stop();
            var existingHighScore = Register.getTechnicalHighScore(username);
            if (score > existingHighScore) {
                Register.updateTechnicalHighScore(username, score);
            }
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

    Button {
        y: 330
        text: "Back Home"
        anchors.horizontalCenterOffset: 8
        onClicked: {
            // Handle "C" button click
            stackView.push("qrc:/pages/page1.qml") // Replace with the actual page for "C" questions
            console.log("home clicked")
             audioElement.stop();
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
    Button {
        y: 410
        text: "view answers"
        anchors.horizontalCenterOffset: 8
        onClicked: {
            // Handle "C" button click
            stackView.push("qrc:/aptitude/resultverb.qml" , { "userResponses": userResponses});  // Replace with the actual page for "C" questions
            console.log("Ceasy clicked")
            audioElement.stop();
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
    Text {
          x: 20
          y: 90
          // Display the elapsed time in seconds
          text: "Total time: " + elapsedTime + " seconds"
          font.pixelSize: 18
          color: "white"
      }
    Audio {
           id: audioElement
           source: "qrc:/audio1.mp3"
           // Replace with the path to your audio file
           autoPlay: true
       }
    Button {
        text: "Print Certificate"
        onClicked: {
           StackView.push("qrc:/certificate_page.qml")
        }
    }



}
