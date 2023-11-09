import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Item {
    visible: true
    width: 350
    height: 600

    property int score: 0
    property int currentQuestionIndex: 0
    property var questionsModel: []
    property var selectedQuestions: []
    property int elapsedTime: 0

    Timer {
        id: questionTimer
        interval: 10000 // 10 seconds
        running: false
        onTriggered: {
            currentQuestionIndex++;
            if (currentQuestionIndex < selectedQuestions.length) {
                // Move to the next question
                stackView.push(questionPage);
                // Reset the timer
                questionTimer.stop();
                questionTimer.start();
            } else {
                // Quiz is complete
                stackView.push("qrc:/technical/scoreverb.qml", { "score": score, "elapsedTime": elapsedTime });
            }
        }
    }

    function shuffleQuestionsModel() {
        var allQuestions = [
                    {
                        question: "What is the next number in the sequence: 2, 4, 8, 16, ...?",
                        option1: "24",
                        option2: "32",
                        option3: "48",
                        option4: "64",
                        correctIndex: 1
                    },
                    {
                        question: "If a shirt costs $20 after a 25% discount, what was its original price?",
                        option1: "$15",
                        option2: "$25",
                        option3: "$30",
                        option4: "$40",
                        correctIndex: 3
                    },
                    {
                        question: "If 3 cats can catch 3 mice in 3 minutes, how many cats are needed to catch 100 mice in 100 minutes?",
                        option1: "1",
                        option2: "3",
                        option3: "100",
                        option4: "300",
                        correctIndex: 2
                    },
                    {
                        question: "Simplify: (4 * 5) + (6 / 2)",
                        option1: "12",
                        option2: "16",
                        option3: "17",
                        option4: "22",
                        correctIndex: 1
                    },
                    {
                        question: "If a train travels 250 miles in 4 hours, what is its speed in miles per hour?",
                        option1: "50 mph",
                        option2: "60 mph",
                        option3: "70 mph",
                        option4: "80 mph",
                        correctIndex: 1
                    },
                    {
                            question: "If 3 apples cost $1, how many apples can you buy for $5?",
                            option1: "5 apples",
                            option2: "10 apples",
                            option3: "15 apples",
                            option4: "20 apples",
                            correctIndex: 1
                        },
                        {
                            question: "A book costs $12, and a pen costs $2. How much do you spend on 3 books and 4 pens?",
                            option1: "$36",
                            option2: "$24",
                            option3: "$50",
                            option4: "$30",
                            correctIndex: 2
                        },
                        {
                            question: "If 2/3 of a number is 8, what is the number?",
                            option1: "6",
                            option2: "9",
                            option3: "12",
                            option4: "16",
                            correctIndex: 3
                        },
                        {
                            question: "What is the missing number in the sequence: 3, 8, 13, ?, 23?",
                            option1: "18",
                            option2: "17",
                            option3: "19",
                            option4: "20",
                            correctIndex: 0
                        },
                        {
                            question: "If it takes 5 workers 6 hours to build a wall, how many hours will it take 3 workers to build the same wall?",
                            option1: "8 hours",
                            option2: "10 hours",
                            option3: "12 hours",
                            option4: "15 hours",
                            correctIndex: 2
                        },
                        {
                            question: "If the day after tomorrow is two days before Wednesday, what day is it today?",
                            option1: "Sunday",
                            option2: "Monday",
                            option3: "Tuesday",
                            option4: "Thursday",
                            correctIndex: 1
                        },
                        {
                            question: "A car travels 360 miles in 6 hours. What is its average speed in miles per hour?",
                            option1: "40 mph",
                            option2: "50 mph",
                            option3: "60 mph",
                            option4: "70 mph",
                            correctIndex: 1
                        },
                        {
                            question: "If a recipe calls for 2/3 cup of sugar and you want to make half the recipe, how much sugar do you need?",
                            option1: "1/4 cup",
                            option2: "1/3 cup",
                            option3: "1/2 cup",
                            option4: "2/3 cup",
                            correctIndex: 2
                        },
                        {
                            question: "What is the value of 5^3 (5 raised to the power of 3)?",
                            option1: "25",
                            option2: "125",
                            option3: "250",
                            option4: "625",
                            correctIndex: 1
                        },
                        {
                            question: "If a bicycle wheel has a radius of 14 inches, what is its circumference (in inches)?",
                            option1: "14π inches",
                            option2: "28 inches",
                            option3: "44 inches",
                            option4: "88 inches",
                            correctIndex: 3
                        },
                        {
                            question: "What is the next number in the sequence: 1, 4, 9, 16, ...?",
                            option1: "20",
                            option2: "24",
                            option3: "25",
                            option4: "36",
                            correctIndex: 3
                        },
                        {
                            question: "If a box contains 12 red balls and 8 blue balls, what is the probability of drawing a red ball randomly?",
                            option1: "1/2",
                            option2: "3/4",
                            option3: "2/5",
                            option4: "5/8",
                            correctIndex: 1
                        },
                        {
                            question: "If a shirt costs $25 after a 20% discount, what was its original price?",
                            option1: "$30",
                            option2: "$35",
                            option3: "$40",
                            option4: "$50",
                            correctIndex: 2
                        },
                        {
                            question: "If the area of a rectangle is 48 square meters and its length is 12 meters, what is its width?",
                            option1: "2 meters",
                            option2: "4 meters",
                            option3: "6 meters",
                            option4: "8 meters",
                            correctIndex: 1
                        },
                        {
                            question: "What is 20% of 80?",
                            option1: "10",
                            option2: "16",
                            option3: "20",
                            option4: "64",
                            correctIndex: 1
                        },
                        {
                            question: "If a train travels at a speed of 60 miles per hour, how far will it travel in 2.5 hours?",
                            option1: "125 miles",
                            option2: "150 miles",
                            option3: "175 miles",
                            option4: "200 miles",
                            correctIndex: 2
                        },
                        {
                            question: "If 3 pencils cost $0.45, how much do 9 pencils cost?",
                            option1: "$1.15",
                            option2: "$1.35",
                            option3: "$1.45",
                            option4: "$1.55",
                            correctIndex: 1
                        },
                        {
                            question: "If the average of three numbers is 15, and two of the numbers are 10 and 20, what is the third number?",
                            option1: "5",
                            option2: "10",
                            option3: "15",
                            option4: "30",
                            correctIndex: 0
                        },
                        {
                            question: "If it takes 8 hours to paint a house, and 4 hours to paint the same house with help, how long will it take the helper to paint the house alone?",
                            option1: "4 hours",
                            option2: "6 hours",
                            option3: "8 hours",
                            option4: "12 hours",
                            correctIndex: 3
                        }
                ];

        var shuffledQuestions = [];
        while (allQuestions.length > 0 && shuffledQuestions.length < 10) {
            var randomIndex = Math.floor(Math.random() * allQuestions.length);
            var question = allQuestions.splice(randomIndex, 1)[0];
            question.options = [
                { text: question.option1, selected: false },
                { text: question.option2, selected: false },
                { text: question.option3, selected: false },
                { text: question.option4, selected: false }
            ];
            question.selectedOption = -1;
            shuffledQuestions.push(question);
        }

        selectedQuestions = shuffledQuestions;
    }

    StackView {
        id: stackView
        anchors.fill: parent

        Rectangle {
            width: parent.width
            height: parent.height
            Image {
                source: "quizra.jpg"
            }
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#42275A" }
                GradientStop { position: 1.0; color: "#734B6D" }
            }

            Button {
                text: "Start Quiz"
                anchors.centerIn: parent
                onClicked: {
                    questionTimer.stop();
                    questionTimer.start();
                    currentQuestionIndex = 0;
                    score = 0; // Reset the score
                    stackView.push(questionPage);
                    elapsedTime = 0; // Reset elapsed time
                    quizTimer.running = true; // Start the timer
                }
            }
        }

        Component {
            id: questionPage
            Rectangle {
                width: parent.width
                height: parent.height
                Image {
                    source: "quizra.jpg"
                }
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#42275A" }
                    GradientStop { position: 1.0; color: "#734B6D" }
                }

                Text {
                    text: selectedQuestions[currentQuestionIndex].question
                    x: 18
                    y: 170
                    font.pixelSize: 18
                    color: "white"
                    wrapMode: Text.WordWrap
                }

                Column {
                    y: 230
                    Repeater {
                        model: selectedQuestions[currentQuestionIndex].options
                        RadioButton {
                            x: 100

                            text: modelData.text
                            checked: modelData.selected
                            onClicked: {
                                if (checked) {
                                    // Check if the selected option is correct
                                    if (index === selectedQuestions[currentQuestionIndex].correctIndex) {
                                        score++; // Increment the score for the correct selection
                                    }
                                    selectedQuestions[currentQuestionIndex].selectedOption = index;
                                    // Reset the timer when the user answers

                                }/*
                                questionTimer.stop();
                                questionTimer.start();*/
                            }
                            Label {
                                color: "white"
                            }
                        }
                    }
                }

//                Button {
//                    text: "Previous Question"
//                    x: 55
//                    y: 430
//                    onClicked: {
//                        currentQuestionIndex--;
//                        if (currentQuestionIndex < 0) {
//                            currentQuestionIndex = 0;
//                        }
//                        // Reset the timer when moving to the previous question
//                        questionTimer.stop();
//                        questionTimer.start();
//                    }
//                    background: Rectangle {
//                        gradient: Gradient {
//                            GradientStop { position: 0.0; color: "#E0D2C7" }
//                            GradientStop { position: 1.0; color: "#44B09E" }
//                        }
//                        radius: 10
//                    }
//                    Label {
//                        color: "white"
//                    }
//                }

                Button {
                    text: currentQuestionIndex === (selectedQuestions.length - 1) ? "Submit" : "Next Question"
                    x: 165
                    y: 430
                    onClicked: {
                        currentQuestionIndex++;

                        if (currentQuestionIndex < selectedQuestions.length) {
                            // Move to the next question
                            stackView.push(questionPage);
                            // Reset the timer
                            questionTimer.stop();
                            questionTimer.start();
                        } else {
                            // Quiz is complete
                            stackView.push("qrc:/technical/scoreverb.qml", { "score": score, "elapsedTime": elapsedTime });
                        }
                    }
                    background: Rectangle {
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#E0D2C7" }
                            GradientStop { position: 1.0; color: "#44B09E" }
                        }
                        radius: 10
                    }
                    Label {
                        color: "white"
                    }
                }
            }
        }
    }

    function updateTime() {
        if (currentQuestionIndex < selectedQuestions.length) {
            console.log("Elapsed Time: " + elapsedTime)
        }
    }

    Timer {
        id: quizTimer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            updateTime();
            elapsedTime += 1;
        }
    }

    Component.onCompleted: {
        shuffleQuestionsModel();
    }
}
