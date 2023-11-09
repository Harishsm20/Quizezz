import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    property variant quizData: []
    property int currentQuestionIndex: 0
    property int score: 0



    gradient: Gradient {
        GradientStop { position: 0.0; color: "#DDBDFC" }
        GradientStop { position: 1.0; color: "#96C8FB" }
    }

    Text {
        text: "Quiz Page"
        font.pixelSize: 24
        color: "white"
        x: (parent.width - width) / 2
        y: 20
    }

    Text {
        text: "Question " + (currentQuestionIndex + 1) + ": " + quizData[currentQuestionIndex].question
        font.bold: true
        font.pixelSize: 18
        color: "white"
        wrapMode: Text.WordWrap
        x: 20
        y: 70
        width: parent.width - 40
    }

    ListView {
        id: optionsListView
        width: parent.width
        height: parent.height - 200
        model: quizData[currentQuestionIndex].options
        spacing: 10
        x: 20
        y: 120

        delegate: RadioButton {
            text: modelData
            checked: index === quizData[currentQuestionIndex].selectedOption
            onClicked: {
                if (checked) {
                    if (index === quizData[currentQuestionIndex].correctIndex) {
                        score++;
                    }
                    quizData[currentQuestionIndex].selectedOption = index;
                }
            }
            Label {
                color: "white"
            }
        }
    }

    Button {
        text: "Next Question"
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            currentQuestionIndex++;
            if (currentQuestionIndex < quizData.length) {
                optionsListView.currentIndex = -1;
            } else {
                // Quiz is finished, display the score
                stackView.push("qrc:/highscore.qml", { "score": score });
            }
        }
        background: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#42275A" }
                GradientStop { position: 1.0; color: "#734B6D" }
            }
            radius: 10
        }
        Label {
            color: "white"
        }
        x: (parent.width - width) / 2
        y: parent.height - height - 20
    }
}
