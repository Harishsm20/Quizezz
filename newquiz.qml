import QtQuick 2.1
import QtQuick.Controls 2.12

Page {
    property StackView stackView

    header: Label {
        text: "Quiz Creator"
        font.pixelSize: 24
    }

    ListView {
        id: questionListView
        model: ListModel {}

        delegate: Item {
            width: parent.width

            Column {
                TextField {
                    placeholderText: "Enter the question"
                    onAccepted: {
                        addQuestion()
                        clearFields()
                    }
                }

                Repeater {
                    model: 4 // Number of options

                    TextField {
                        placeholderText: "Option " + (index + 1)
                    }
                }

                ComboBox {
                    model: ["Option 1", "Option 2", "Option 3", "Option 4"]
                }

                Button {
                    text: "Add Question"
                    onClicked: {
                        addQuestion()
                        clearFields()
                    }
                }
            }
        }
    }

    Button {
        text: "Create Quiz"
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            stackView.push(CreateQuizPage {stackView: stackView })
        }
    }

    function addQuestion() {
        // Create a new question and add it to the ListView
        questionListView.model.append({
            question: questionListView.delegate.itemAt(0).text,
            options: [
                questionListView.delegate.itemAt(1).text,
                questionListView.delegate.itemAt(2).text,
                questionListView.delegate.itemAt(3).text,
                questionListView.delegate.itemAt(4).text
            ],
            correctAnswer: questionListView.delegate.itemAt(5).currentIndex
        });
    }

    function clearFields() {
        for (var i = 0; i < questionListView.delegate.count; i++) {
            questionListView.delegate.itemAt(i).text = "";
        }
    }
}
