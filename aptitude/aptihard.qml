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
        interval: 11000 // 10 seconds
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
                    { question: "What is the most widely \nused programming language?", option1: "Python", option2: "Java", option3: "C++", option4: "Ruby", correctIndex: 0 },
                      { question: "Which data structure \nuses the Last-In-First-Out \n(LIFO) principle?", option1: "Queue", option2: "Stack", option3: "Array", option4: "Linked List", correctIndex: 1 },
                      { question: "What does CPU stand for?", option1: "Central Processing Unit", option2: "Computer Personal Unit", option3: "Central Process Unit", option4: "Central Processor Unit", correctIndex: 0 },
                      { question: "Which programming language \nis known as the \n'father of all languages'?", option1: "Fortran", option2: "COBOL", option3: "C", option4: "Assembly Language", correctIndex: 2 },
                      { question: "Which company developed the \nPython programming \nlanguage?", option1: "Google", option2: "Microsoft", option3: "Facebook", option4: "Netflix", correctIndex: 0 },
                      { question: "What is the binary representation \nof 7 in base 10?", option1: "101", option2: "110", option3: "111", option4: "1000", correctIndex: 2 },
                      { question: "Which programming language is \nknown for its use in \nweb development and is often associated \nwith front-end development?", option1: "Java", option2: "Python", option3: "JavaScript", option4: "C#", correctIndex: 2 },
                      { question: "What is an algorithm?", option1: "A computer virus", option2: "A step-by-step procedure for solving a problem", option3: "A type of programming language", option4: "A computer hardware component", correctIndex: 1 },
                      { question: "Which data structure is used to \nimplement a Last-In-First-Out \n(LIFO) behavior?", option1: "Queue", option2: "Array", option3: "Stack", option4: "Linked List", correctIndex: 2 },
                      { question: "What does HTML stand for in \nweb development?", option1: "Hypertext Markup Language", option2: "Hyper Transfer Markup Language", option3: "High Tech Modern Language", option4: "Hyperlink and Text Markup Language", correctIndex: 0 },
                      { question: "Which programming language is \noften used for data analysis \nand scientific computing?", option1: "C++", option2: "Java", option3: "Python", option4: "Ruby", correctIndex: 2 },
                      { question: "What is the default file \nextension for a Python \nsource code file?", option1: ".exe", option2: ".py", option3: ".java", option4: ".html", correctIndex: 1 },
                      { question: "Which of the following is \nNOT a programming language?", option1: "Java", option2: "Linux", option3: "C++", option4: "Ruby", correctIndex: 1 },
                      { question: "What is the purpose of an \n'if' statement in programming?", option1: "To repeat a block of code", option2: "To define a function", option3: "To make a decision and execute code conditionally", option4: "To declare a variable", correctIndex: 2 },
                      { question: "Which of the following is \na commonly used version \ncontrol system?", option1: "JavaScript", option2: "Subversion (SVN)", option3: "Python", option4: "Ruby", correctIndex: 1 },
                      { question: "What is the primary function \nof a compiler?", option1: "To translate high-level programming code into machine code", option2: "To run a program", option3: "To debug a program", option4: "To store data", correctIndex: 0 },
                      { question: "Which data structure stores \nelements in a key-value \npair format?", option1: "Stack", option2: "Queue", option3: "Dictionary", option4: "Array", correctIndex: 2 },
                      { question: "What does CSS stand for in \nweb development?", option1: "Computer Style Sheets", option2: "Cascading Style Sheets", option3: "Creative Style Sheets", option4: "Coded Style Sheets", correctIndex: 1 },
                      { question: "In object-oriented programming, \nwhat is a class?", option1: "A data type that can store multiple values", option2: "A template for creating objects", option3: "A mathematical equation", option4: "A loop structure", correctIndex: 1 },
                      { question: "Which programming language is \noften used for developing \nmobile applications?", option1: "Java", option2: "Python", option3: "C++", option4: "Ruby", correctIndex: 0 },
                      { question: "What is the purpose of SQL \nin database management?", option1: "To create web pages", option2: "To query and manage data in a relational database", option3: "To develop mobile apps", option4: "To encrypt data", correctIndex: 1 },
                      { question: "Which of the following is an \nopen-source operating system?", option1: "Windows", option2: "macOS", option3: "Linux", option4: "iOS", correctIndex: 2 },
                      { question: "What is the binary representation \nof 15 in base 10?", option1: "1010", option2: "1100", option3: "1110", option4: "1111", correctIndex: 3 },
                      { question: "Which programming language is \nknown for its use in machine \nlearning and artificial intelligence?", option1: "JavaScript", option2: "Python", option3: "Java", option4: "C#", correctIndex: 1 },
                      { question: "What does GUI stand \nfor in computing?", option1: "Graphical User Interface", option2: "General User Interaction", option3: "Global User Integration", option4: "Graphical User Integration", correctIndex: 0 },
                      { question: "Which of the following \nis NOT a web browser?", option1: "Google Chrome", option2: "Mozilla Firefox", option3: "Microsoft Word", option4: "Safari", correctIndex: 2 },
                      { question: "What is the purpose of a \n'for' loop in programming?", option1: "To define a function", option2: "To make a decision and execute code conditionally", option3: "To repeat a block of code a specific number of times", option4: "To declare a variable", correctIndex: 2 },
                      { question: "Which of the following is a \ncommonly used version control system?", option1: "Subversion (SVN)", option2: "JavaScript", option3: "Python", option4: "Ruby", correctIndex: 0 },
                      { question: "What does URL stand for in \nweb development?", option1: "Uniform Resource Locator", option2: "Universal Record Locator", option3: "Unified Reference Language", option4: "User Registration Link", correctIndex: 0 },
                      { question: "In programming, what is a \nsyntax error?", option1: "An error that occurs during runtime", option2: "An error related to incorrect programming language usage", option3: "An error in the computer's hardware", option4: "An error in the user interface", correctIndex: 1 },
                      { question: "What is the primary purpose \nof a database management system \n(DBMS)?", option1: "To display web pages", option2: "To manage and organize data", option3: "To create graphics", option4: "To browse the internet", correctIndex: 1 },
                      { question: "Which programming language \nis often used for building \nAndroid applications?", option1: "Java", option2: "Python", option3: "C++", option4: "Ruby", correctIndex: 0 },
                      { question: "What is the binary representation \nof 4 in base 10?", option1: "100", option2: "101", option3: "110", option4: "111", correctIndex: 0 },
                      { question: "Which programming language is \nknown for its use in data \nanalysis, statistics, and data visualization?", option1: "C#", option2: "Python", option3: "Java", option4: "Ruby", correctIndex: 1 },
                      { question: "What is the purpose of the 'else' \nstatement in programming?", option1: "To create a loop", option2: "To define a function", option3: "To execute code when a condition is not met", option4: "To declare a variable", correctIndex: 2 },
                      { question: "Which data structure uses the \nFirst-In-First-Out (FIFO) principle?", option1: "Stack", option2: "Queue", option3: "Array", option4: "Linked List", correctIndex: 1 },
                      { question: "What is the primary function \nof an operating system?", option1: "To browse the internet", option2: "To create graphics", option3: "To manage hardware and software resources", option4: "To write code", correctIndex: 2 },
                      { question: "Which of the following is NOT \na commonly used programming paradigm?", option1: "Imperative", option2: "Functional", option3: "Object-Oriented", option4: "Sequential", correctIndex: 3 },
                      { question: "What is the purpose of the \n'while' loop in programming?", option1: "To create graphics", option2: "To define a function", option3: "To repeat a block of code while a condition is true", option4: "To declare a variable", correctIndex: 2 },
                      { question: "Which programming language is \noften used for game development?", option1: "Java", option2: "Python", option3: "C++", option4: "Ruby", correctIndex: 2 },
                      { question: "What does RAM \nstand for in computing?", option1: "Random Access Memory", option2: "Read-Only Memory", option3: "Random Application Module", option4: "Rapid Action Mode", correctIndex: 0 },
                      { question: "Which of the following \nis a common text editor used for programming?", option1: "Microsoft Word", option2: "Sublime Text", option3: "Adobe Photoshop", option4: "Google Chrome", correctIndex: 1 },
                      { question: "What is the purpose of \nan 'array' in programming?", option1: "To store a collection of values", option2: "To create a loop", option3: "To define a function", option4: "To manage hardware resources", correctIndex: 0 },
                      { question: "What is the binary representation \nof 10 in base 10?", option1: "1000", option2: "1010", option3: "1100", option4: "1110", correctIndex: 1 },
                      { question: "Which programming language is known \nfor its use in scientific and numeric computing?", option1: "Java", option2: "Python", option3: "C++", option4: "Ruby", correctIndex: 1 },
                      { question: "What does API stand \nfor in software development?", option1: "Application Program Interface", option2: "Advanced Programming Integration", option3: "Application Protocol Interface", option4: "Advanced Program Interface", correctIndex: 0 },
                      { question: "In object-oriented \nprogramming, what is an 'object'?", option1: "A physical device", option2: "An instance of a class with its own properties and methods", option3: "A data type", option4: "A type of loop", correctIndex: 1 },
                      { question: "Which programming language is known \nfor its use in building web applications on the server-side?", option1: "JavaScript", option2: "Python", option3: "Java", option4: "Ruby", correctIndex: 2 },
                      { question: "What is the purpose of an \n'else if' statement \nin programming?", option1: "To create a loop", option2: "To define a function", option3: "To execute code conditionally based on multiple conditions", option4: "To declare a variable", correctIndex: 2 },
                      { question: "Which of the following is a commonly \nused integrated development \nenvironment (IDE) for programming?", option1: "Google Chrome", option2: "Eclipse", option3: "Adobe Photoshop", option4: "Microsoft Word", correctIndex: 1 },
                      { question: "What is the primary \nfunction of a web server?", option1: "To develop mobile apps", option2: "To create graphics", option3: "To host and deliver web content to clients", option4: "To manage hardware resources", correctIndex: 2 }
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
                AnimatedImage {
                            id: gifBackground
                            x:275
                            y:10
                            width: 50
                            height: 50
                            source: "qrc:/assets/timer.gif" // Set the path to your GIF file


                            Timer {
                                        id: gifTimer
                                        interval: 10000 // 5000 milliseconds = 5 seconds
                                        running: false

                                        onTriggered: {
                                            gifTimer.stop(); // Stop the timer when it triggers
                                            gifBackground.visible = false; // Hide the GIF after 5 seconds
                                        }
                                    }
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
                            stackView.push("qrc:/aptitude/Scoreapti.qml", { "score": score, "elapsedTime": elapsedTime });
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
