import QtQuick 2.12
import QtQuick.Controls 2.12
import com.example.login 1.0
Item {
    id: window
    width: 340
    height: 600

    property Register loginManager: Register {}


    Register {
        id: loginManager
    }

    Rectangle {
        width: parent.width
        height: parent.height
        Image {

            source: "qrc:/assets/newloginbg.jpg"
        }

//        Column {
//            spacing: 20
//            anchors.centerIn: parent


            TextField {
                x:80
                y:200
                id: usernameInput
                placeholderText: "Username"
                background: Rectangle {
                    color: "white"  // Background color of the text field
                    radius: 5      // Adjust the radius as needed

                    // You can also set other properties for the background, like border or gradient.
                    border.color: "gray"
                    width: 200
                    height: 40


                }
            }

            TextField {
                x:80
                y:250
                id: passwordInput
                placeholderText: "Password"
                echoMode: TextInput.Password
                background: Rectangle {
                    color: "white"  // Background color of the text field
                    radius: 5      // Adjust the radius as needed

                    // You can also set other properties for the background, like border or gradient.
                    border.color: "gray"
                }

                width: 200
                height: 40
            }

            Button {
                x:150
                y:300
                background: Rectangle {
                    radius: 5
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#EF6DA0" }
                        GradientStop { position: 1.0; color: "#EE8E6B" }
                    }
                }
                text: "Login"

                onClicked: {
                    if (loginManager.login(usernameInput.text, passwordInput.text)) {
                        stackView.push("qrc:/pages/quizgame.qml",{"username" : usernameInput.text});
                  // Login successful, navigate to another page or perform actions
                        console.log("Login successful!");

                    } else {
                        // Login failed, show an error message or handle it accordingly
                        console.log("Login failed!");
                    }
                }
            }
            Button{

                x:140
                y:345
                background: Rectangle {
                    radius: 5
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#EF6DA0" }
                        GradientStop { position: 1.0; color: "#EE8E6B" }
                    }
                }
                                text: "Register?"
                                onClicked: {
                                    stackView.push("qrc:/DB/registration.qml")

                                }

            }
        }
    }
//}
