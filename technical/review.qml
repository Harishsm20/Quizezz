import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    visible: true
    width: 350
    height: 600

    property var selectedQuestions: []

    ListView {
        width: parent.width
        height: parent.height
        model: selectedQuestions

        delegate: Item {
            width: parent.width
            height: 120

            Rectangle {
                width: parent.width
                height: 100
                color: (modelData.selectedOption === modelData.correctIndex) ? "green" : "red"

                Text {
                    text: modelData.question
                    anchors.centerIn: parent
                    font.pixelSize: 18
                    color: "white"
                    wrapMode: Text.WordWrap
                }
            }

            Text {
                text: "Your Answer: " + (modelData.selectedOption >= 0 ? modelData.options[modelData.selectedOption].text : "Not Answered")
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                color: "white"
                padding: 10
            }

            Text {
                text: "Correct Answer: " + modelData.options[modelData.correctIndex].text
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                color: "white"
                padding: 10
            }
        }
    }

    Button {
        text: "Back to Main Menu"
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        onClicked: {
            // Go back to the main menu or perform any other action you want
            Qt.quit();
        }
    }
}
