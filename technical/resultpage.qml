//import QtQuick 2.12
//import QtQuick.Controls 2.12

//Page {
//    title: "Quiz Results"

//    ListView {
//        width: parent.width
//        height: parent.height

//        model: selectedQuestions

//        delegate: Item {
//            width: parent.width
//            height: 50

//            Text {
//                anchors.verticalCenter: parent.verticalCenter

//                text: {
//                    if (model.selectedOption === model.correctIndex)
//                        return "Correct: " + model.question;
//                    else if (model.selectedOption === -1)
//                        return "Not Answered: " + model.question;
//                    else
//                        return "Incorrect: " + model.question;
//                }

//                color: {
//                    if (model.selectedOption === model.correctIndex)
//                        return "green";
//                    else if (model.selectedOption === -1)
//                        return "black";
//                    else
//                        return "red";
//                }
//            }
//        }
//    }

//    Button {
//        text: "Back to Quiz"
//        onClicked: {
//            // Go back to the quiz
//            stackView.pop();
//        }
//    }
//}

// scoreapti.qml
import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    visible: true
    width: 350
    height: 600

    property var userResponses: []



    Column {
        spacing: 10
        anchors.centerIn: parent


        Repeater {
            model: userResponses.length
            Text {
                text: "Question " + (index + 1) + ": " + userResponses[index]
            }
        }
    }
}
