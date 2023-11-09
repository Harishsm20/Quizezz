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
                stackView.push("qrc:/scoretechnical.qml", { "score": score, "elapsedTime": elapsedTime });
            }
        }
    }

    function shuffleQuestionsModel() {
        var allQuestions = [
                    {
                            question: "If the time is 3:15, what is the angle between the hour and minute hands of the clock?",
                            option1: "37.5 degrees",
                            option2: "45 degrees",
                            option3: "52.5 degrees",
                            option4: "60 degrees",
                            correctIndex: 2
                        },
                        {
                            question: "A train travels 300 kilometers in 5 hours. What is its average speed in kilometers per hour?",
                            option1: "50 km/h",
                            option2: "55 km/h",
                            option3: "60 km/h",
                            option4: "65 km/h",
                            correctIndex: 1
                        },
                        {
                            question: "If you have a 10-meter long rope and you cut it into three pieces such that the first piece is 2 meters longer than the second and the second piece is 3 meters longer than the third, how long is the shortest piece?",
                            option1: "1 meter",
                            option2: "2 meters",
                            option3: "3 meters",
                            option4: "4 meters",
                            correctIndex: 2
                        },
                        {
                            question: "What is the area of a right triangle with a base of 8 units and a height of 6 units?",
                            option1: "20 square units",
                            option2: "24 square units",
                            option3: "30 square units",
                            option4: "36 square units",
                            correctIndex: 1
                        },
                        {
                            question: "If the sum of three consecutive odd numbers is 45, what is the second number in the sequence?",
                            option1: "13",
                            option2: "15",
                            option3: "17",
                            option4: "19",
                            correctIndex: 2
                        },
                        {
                            question: "A car travels 180 miles on 4 gallons of gasoline. What is its fuel efficiency in miles per gallon (MPG)?",
                            option1: "30 MPG",
                            option2: "40 MPG",
                            option3: "45 MPG",
                            option4: "50 MPG",
                            correctIndex: 0
                        },
                        {
                            question: "If a shirt originally costs $35 and is on sale for 20% off, what is the sale price?",
                            option1: "$25",
                            option2: "$28",
                            option3: "$30",
                            option4: "$32",
                            correctIndex: 1
                        },
                        {
                            question: "A bus travels at a speed of 60 kilometers per hour. How long will it take to cover a distance of 240 kilometers?",
                            option1: "2 hours",
                            option2: "3 hours",
                            option3: "4 hours",
                            option4: "5 hours",
                            correctIndex: 2
                        },
                        {
                            question: "The sum of two consecutive even numbers is 58. What are the numbers?",
                            option1: "28 and 30",
                            option2: "30 and 32",
                            option3: "32 and 34",
                            option4: "34 and 36",
                            correctIndex: 2
                        },
                        {
                            question: "If a bicycle wheel has a radius of 14 inches, what is its circumference (in inches)?",
                            option1: "28π inches",
                            option2: "44 inches",
                            option3: "88 inches",
                            option4: "56 inches",
                            correctIndex: 3
                        },
                        {
                            question: "A rectangular garden is 12 meters long and 8 meters wide. What is its perimeter (in meters)?",
                            option1: "16 meters",
                            option2: "32 meters",
                            option3: "40 meters",
                            option4: "48 meters",
                            correctIndex: 2
                        },
                        {
                            question: "If 20% of a number is 40, what is the number?",
                            option1: "100",
                            option2: "150",
                            option3: "200",
                            option4: "250",
                            correctIndex: 3
                        },
                        {
                            question: "A baker has 5 chocolate muffins and 8 blueberry muffins. If he wants to arrange them in a row, how many ways can he do it?",
                            option1: "40 ways",
                            option2: "65 ways",
                            option3: "104 ways",
                            option4: "120 ways",
                            correctIndex: 2
                        },
                        {
                            question: "If the square of a number is 64, what is the number?",
                            option1: "4",
                            option2: "6",
                            option3: "8",
                            option4: "10",
                            correctIndex: 2
                        },
                        {
                            question: "A recipe calls for 2 cups of flour and 1 cup of sugar. If you want to make 3 batches of the recipe, how many cups of sugar do you need?",
                            option1: "1 cup",
                            option2: "2 cups",
                            option3: "3 cups",
                            option4: "4 cups",
                            correctIndex: 3
                        },
                        {
                            question: "If a store sells a shirt for $15 and makes a profit of 20%, how much did it cost the store to buy the shirt?",
                            option1: "$10",
                            option2: "$11.25",
                            option3: "$12",
                            option4: "$12.50",
                            correctIndex: 1
                        },
                        {
                            question: "A bus travels a distance of 180 kilometers at a speed of 60 kilometers per hour. How long does the journey take?",
                            option1: "2 hours",
                            option2: "3 hours",
                            option3: "4 hours",
                            option4: "5 hours",
                            correctIndex: 1
                        },
                        {
                            question: "If a box contains 5 red balls and 7 green balls, what is the probability of drawing a red ball randomly?",
                            option1: "5/12",
                            option2: "5/7",
                            option3: "7/12",
                            option4: "7/5",
                            correctIndex: 0
                        },
                        {
                            question: "The difference between two numbers is 12, and their sum is 38. What are the numbers?",
                            option1: "13 and 25",
                            option2: "15 and 27",
                            option3: "14 and 26",
                            option4: "12 and 26",
                            correctIndex: 3
                        },
                        {
                            question: "A ladder is placed against a wall such that its base is 6 meters from the wall. If the ladder reaches a height of 8 meters on the wall, how long is the ladder?",
                            option1: "8 meters",
                            option2: "10 meters",
                            option3: "12 meters",
                            option4: "14 meters",
                            correctIndex: 3
                        },
                        {
                            question: "If a book is 15 centimeters long, 10 centimeters wide, and 2 centimeters thick, what is its volume (in cubic centimeters)?",
                            option1: "200 cm³",
                            option2: "250 cm³",
                            option3: "300 cm³",
                            option4: "350 cm³",
                            correctIndex: 2
                        },
                        {
                            question: "A rectangular room is 5 meters long, 4 meters wide, and 3 meters high. What is its volume (in cubic meters)?",
                            option1: "60 m³",
                            option2: "80 m³",
                            option3: "100 m³",
                            option4: "120 m³",
                            correctIndex: 0
                        },
                        {
                            question: "If a car depreciates in value by 15% each year, what will be its value after 3 years if it was originally worth $20,000?",
                            option1: "$12,750",
                            option2: "$13,600",
                            option3: "$14,450",
                            option4: "$15,300",
                            correctIndex: 0
                        },
                        {
                            question: "A circular swimming pool has a diameter of 10 meters. What is its area (in square meters)?",
                            option1: "25π square meters",
                            option2: "50π square meters",
                            option3: "100π square meters",
                            option4: "200π square meters",
                            correctIndex: 1
                        },
                        {
                            question: "If a bicycle travels at a speed of 15 kilometers per hour for 2 hours, how far does it travel?",
                            option1: "15 km",
                            option2: "20 km",
                            option3: "30 km",
                            option4: "40 km",
                            correctIndex: 2
                        },
                        {
                            question: "A farmer has a rectangular field that is 80 meters long and 60 meters wide. What is the perimeter of the field (in meters)?",
                            option1: "200 meters",
                            option2: "280 meters",
                            option3: "320 meters",
                            option4: "400 meters",
                            correctIndex: 3
                        },
                        {
                            question: "If a computer program runs for 8 hours and consumes 4 gigabytes of data, what is its data usage rate (in gigabytes per hour)?",
                            option1: "0.25 GB/hr",
                            option2: "0.5 GB/hr",
                            option3: "1 GB/hr",
                            option4: "2 GB/hr",
                            correctIndex: 2
                        },
                        {
                            question: "A box contains 4 red balls, 3 green balls, and 2 blue balls. If one ball is drawn randomly, what is the probability of drawing a red ball?",
                            option1: "2/9",
                            option2: "3/9",
                            option3: "4/9",
                            option4: "5/9",
                            correctIndex: 2
                        },
                        {
                            question: "If the area of a square is 144 square meters, what is the length of one side of the square (in meters)?",
                            option1: "6 meters",
                            option2: "12 meters",
                            option3: "18 meters",
                            option4: "24 meters",
                            correctIndex: 1
                        },
                        {
                            question: "A company produces 3000 widgets in 5 hours. What is its production rate (in widgets per hour)?",
                            option1: "400 widgets/hr",
                            option2: "600 widgets/hr",
                            option3: "750 widgets/hr",
                            option4: "900 widgets/hr",
                            correctIndex: 1
                        },
                        {
                            question: "If the sum of two numbers is 20 and their difference is 4, what are the numbers?",
                            option1: "8 and 12",
                            option2: "10 and 14",
                            option3: "6 and 16",
                            option4: "7 and 13",
                            correctIndex: 2
                        },
                        {
                            question: "A recipe calls for 3/4 cup of sugar, but you want to make half of the recipe. How much sugar do you need?",
                            option1: "1/4 cup",
                            option2: "3/8 cup",
                            option3: "1/2 cup",
                            option4: "5/8 cup",
                            correctIndex: 1
                        },
                        {
                            question: "A tank can hold 200 liters of water. If it is currently filled to 75% of its capacity, how many liters of water are in the tank?",
                            option1: "125 liters",
                            option2: "150 liters",
                            option3: "175 liters",
                            option4: "180 liters",
                            correctIndex: 1
                        },
                        {
                            question: "A shopkeeper sells an item for $120 and makes a profit of 25%. What is the cost price of the item?",
                            option1: "$80",
                            option2: "$90",
                            option3: "$96",
                            option4: "$100",
                            correctIndex: 2
                        },
                        {
                            question: "If the area of a circle is 64π square units, what is its radius (in units)?",
                            option1: "4 units",
                            option2: "6 units",
                            option3: "8 units",
                            option4: "10 units",
                            correctIndex: 1
                        },
                        {
                            question: "If a car travels at a constant speed of 50 miles per hour, how long does it take to travel 200 miles?",
                            option1: "2 hours",
                            option2: "3 hours",
                            option3: "4 hours",
                            option4: "5 hours",
                            correctIndex: 2
                        },
                        {
                            question: "A baker can bake 24 cupcakes in 2 hours. How many cupcakes can he bake in 6 hours?",
                            option1: "48 cupcakes",
                            option2: "54 cupcakes",
                            option3: "72 cupcakes",
                            option4: "96 cupcakes",
                            correctIndex: 3
                        },
                        {
                            question: "If a printer can print 60 pages in 6 minutes, how many pages can it print in 30 minutes?",
                            option1: "150 pages",
                            option2: "200 pages",
                            option3: "250 pages",
                            option4: "300 pages",
                            correctIndex: 2
                        },
                        {
                            question: "A rectangular swimming pool is 25 meters long and 10 meters wide. What is its area (in square meters)?",
                            option1: "200 sq meters",
                            option2: "250 sq meters",
                            option3: "300 sq meters",
                            option4: "350 sq meters",
                            correctIndex: 0
                        },
                        {
                            question: "If 30% of a number is 45, what is the number?",
                            option1: "90",
                            option2: "120",
                            option3: "150",
                            option4: "180",
                            correctIndex: 2
                        },
                        {
                            question: "A box contains 5 red balls, 3 green balls, and 4 blue balls. If one ball is drawn randomly, what is the probability of drawing a blue ball?",
                            option1: "2/12",
                            option2: "3/12",
                            option3: "4/12",
                            option4: "5/12",
                            correctIndex: 2
                        },
                        {
                            question: "If the length of a rectangle is 8 meters and the width is 6 meters, what is its area (in square meters)?",
                            option1: "24 sq meters",
                            option2: "36 sq meters",
                            option3: "48 sq meters",
                            option4: "72 sq meters",
                            correctIndex: 1
                        },
                        {
                            question: "A bicycle travels at a speed of 15 kilometers per hour. How long does it take to travel 45 kilometers?",
                            option1: "1 hour",
                            option2: "2 hours",
                            option3: "3 hours",
                            option4: "4 hours",
                            correctIndex: 2
                        },
                        {
                            question: "If a book originally costs $25 and is on sale for 20% off, what is the sale price?",
                            option1: "$15",
                            option2: "$18",
                            option3: "$20",
                            option4: "$22",
                            correctIndex: 3
                        },
                        {
                            question: "A train travels 150 kilometers in 2 hours. What is its average speed in kilometers per hour?",
                            option1: "60 km/h",
                            option2: "75 km/h",
                            option3: "80 km/h",
                            option4: "90 km/h",
                            correctIndex: 2
                        },
                        {
                            question: "If the sum of two consecutive numbers is 25, what are the numbers?",
                            option1: "12 and 13",
                            option2: "13 and 14",
                            option3: "14 and 15",
                            option4: "15 and 16",
                            correctIndex: 1
                        },
                        {
                            question: "A rectangle has a length of 10 meters and a width of 5 meters. What is its perimeter (in meters)?",
                            option1: "15 meters",
                            option2: "20 meters",
                            option3: "25 meters",
                            option4: "30 meters",
                            correctIndex: 3
                        },
                        {
                            question: "If a smartphone costs $400 and is on sale for 10% off, what is the sale price?",
                            option1: "$360",
                            option2: "$380",
                            option3: "$390",
                            option4: "$410",
                            correctIndex: 1
                        },
                        {
                            question: "A car travels at a constant speed of 60 miles per hour. How far will it travel in 2.5 hours?",
                            option1: "100 miles",
                            option2: "125 miles",
                            option3: "150 miles",
                            option4: "175 miles",
                            correctIndex: 2
                        },
                        {
                            question: "If a rectangle has a length of 12 meters and a width of 8 meters, what is its area (in square meters)?",
                            option1: "48 sq meters",
                            option2: "64 sq meters",
                            option3: "80 sq meters",
                            option4: "96 sq meters",
                            correctIndex: 1
                        },
                        {
                            question: "A computer can perform 200 calculations in 5 seconds. What is its calculation rate (in calculations per second)?",
                            option1: "20 calculations/sec",
                            option2: "25 calculations/sec",
                            option3: "30 calculations/sec",
                            option4: "35 calculations/sec",
                            correctIndex: 0
                        },
                        {
                            question: "If a box contains 6 red balls and 4 blue balls, what is the probability of drawing a blue ball randomly?",
                            option1: "2/5",
                            option2: "3/5",
                            option3: "4/5",
                            option4: "5/6",
                            correctIndex: 0
                        },
                        {
                            question: "The sum of three consecutive even numbers is 90. What is the largest number in the sequence?",
                            option1: "28",
                            option2: "30",
                            option3: "32",
                            option4: "34",
                            correctIndex: 2
                        },
                        {
                            question: "A rectangular room is 15 feet long and 10 feet wide. What is its area (in square feet)?",
                            option1: "100 sq feet",
                            option2: "125 sq feet",
                            option3: "150 sq feet",
                            option4: "175 sq feet",
                            correctIndex: 2
                        },
                        {
                            question: "If a store sells a jacket for $80 and makes a profit of 15%, what is the profit earned on the jacket?",
                            option1: "$10",
                            option2: "$12",
                            option3: "$15",
                            option4: "$20",
                            correctIndex: 1
                        },
                        {
                            question: "A circular pizza has a radius of 12 inches. What is its area (in square inches)?",
                            option1: "36π sq inches",
                            option2: "72π sq inches",
                            option3: "144π sq inches",
                            option4: "288π sq inches",
                            correctIndex: 3
                        },
                        {
                            question: "If a car travels at a speed of 70 kilometers per hour for 3 hours, how far does it travel?",
                            option1: "180 km",
                            option2: "210 km",
                            option3: "240 km",
                            option4: "270 km",
                            correctIndex: 1
                    }];

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
                            stackView.push("qrc:/scoretechnical.qml", { "score": score, "elapsedTime": elapsedTime });
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
