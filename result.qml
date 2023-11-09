import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    property StackView stackView

    header: Label {
        text: "Create Quiz"
        font.pixelSize: 24
    }

    ListView {
        model: ListModel {
            ListElement {
                question: "What is 2 + 2?"
                options: ["3", "4", "5", "6"]
                correctAnswer: 1
            }
            // Add more questions here
        }

        delegate: Item {
            width: parent.width

            Column {
                Text {
                    text: model.question
                    font.pixelSize: 18
                    wrapMode: Text.WordWrap
                }

                Repeater {
                    model: model.options

                    RadioButton {
                        text: model.modelData
                        checked: false

                        onClicked: {
                            // Check if the selected option is correct
                            if (index === model.correctAnswer) {
                                console.log("Correct!")
                            } else {
                                console.log("Wrong!")
                            }
                        }
                    }
                }
            }
        }
    }

    Button {
        text: "Back to Main Page"
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            stackView.pop()
        }
    }
}
