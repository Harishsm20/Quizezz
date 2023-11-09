import QtQuick 2.12
import QtQuick.Controls 2.12
import com.example.login 1.0

Item {
    visible: true
    width: 350
    height: 600
    Image {

        source: "qrc:/assets/rm251-mind-01-f.jpg"
    }

    Register {
        id: registrationManager
    }

    Rectangle {
        Image {

            source: "qrc:/assets/newloginbg.jpg"
        }
        width: parent.width
        height: parent.height

//        Column {
//            spacing: 20
//            anchors.centerIn: parent

            TextField {
                x:80
                y:200
                id: newUsernameInput
                placeholderText: "New Username"
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
                id: newPasswordInput
                placeholderText: "New Password"
                echoMode: TextInput.Password
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
                y:300
                id: newnameinput
                placeholderText: "New Name"
                echoMode: TextInput.name
                background: Rectangle {
                    color: "white"  // Background color of the text field
                    radius: 5      // Adjust the radius as needed

                    // You can also set other properties for the background, like border or gradient.
                    border.color: "gray"
                    width: 200
                    height: 40


                }
            }

            Button {
                x:130
                y:350
                background: Rectangle {
                    radius: 5
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#7593CE" }
                        GradientStop { position: 1.0; color: "#BAD9F8" }
                        GradientStop { position: 1.0; color: "#F7FBFC" }
                        GradientStop { position: 1.0; color: "#FFE5E4" }
                        GradientStop { position: 1.0; color: "#F8CACA" }
                        GradientStop { position: 1.0; color: "#EDA6A6" }
                    }
                }
                text: "Register"
                onClicked: {

                    // Perform registration logic here
                    var registrationSuccess = registrationManager.registerUser(newUsernameInput.text, newPasswordInput.text, newnameinput.text);
                    if (registrationSuccess) {

                        console.log("Registration successful!");
                    } else {
                        console.log("Registration failed!");
                    }
                    stackView.push("qrc:/DB/loginpage.qml")
                }
            }
        }
    }
//}



