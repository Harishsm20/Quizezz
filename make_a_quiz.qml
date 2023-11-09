import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    visible: true
    width: 350
    height: 600

    property variant quizData: []
    property int currentQuestionIndex: 0

    function initializeQuestion() {
        return { question: "", options: [], correctAnswer: "" };
    }

    Label {
        text: "Enter Quiz Question " + (currentQuestionIndex + 1)
        font.pixelSize: 24
    }

    TextField {
        id: questionField
        x: 100
        y: 100
        width: 200
        height: 40
        placeholderText: "Enter question"
        onTextChanged: {
            quizData[currentQuestionIndex].question = text;
        }
    }

    TextField {
        id: optionsField
        x: 100
        y: 150
        width: 200
        height: 40
        placeholderText: "Enter options as comma-separated"
        onTextChanged: {
            quizData[currentQuestionIndex].options = text.split(',');
        }
    }

    TextField {
        id: correctAnswerField
        x: 100
        y: 200
        width: 200
        height: 40
        placeholderText: "Enter correct option"
        onTextChanged: {
            quizData[currentQuestionIndex].correctAnswer = text;
        }
    }

    Button {
        text: "Next Question"
        x: 130
        y: 250
        onClicked: {
            if (currentQuestionIndex < 2) {
                currentQuestionIndex++;
                quizData.push(initializeQuestion()); // Initialize a new question
                questionField.text = "";
                optionsField.text = "";
                correctAnswerField.text = "";
            } else {
                // If all questions have been entered, proceed to the quiz
                stackView.push("qrc:/quizpage.qml", { "quizData": quizData });
            }
        }
    }

    Component.onCompleted: {
        // Initialize the first question
        quizData.push(initializeQuestion());
    }
}
