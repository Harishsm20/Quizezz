//import QtQuick 2.12
//import QtQuick.Controls 2.12

//Rectangle {
//    width: 550
//    height: 600
//    color: "white"

////    Image {
////        id: certificateImage
////        source: "qrc:/assets/certificate.png" // Replace with the path to your certificate image
////        anchors.centerIn: parent
////        width: 600 // Set the width of the image
////        height: 400 // Set the height of the image
////    }

//    Text {
//        id: nameLabel
//        text: "" // This will be set dynamically
//        color: "white"
//        font.bold: true
//        x:200
//        font.pixelSize: 20
//        anchors.centerIn: certificateImage // Center the text on the certificate image
//    }

//    TextField {
//        id: nameInput
//        placeholderText: "Enter your name"
//        anchors {
//            bottom: parent.bottom
//            horizontalCenter: parent.horizontalCenter
//        }
//    }

//    Button {
//        text: "Print Certificate"
//        anchors {
//            bottom: nameInput.top
//            horizontalCenter: parent.horizontalCenter
//        }

//        onClicked: {
//            nameLabel.text = nameInput.text;
//            stackView.push("qrc:/certi_download.qml",{"name": nameInput})
//        }
//    }
//}


import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    width: 550
    height: 600
    color: "white"

    Text {
        id: nameLabel
        text: "" // This will be set dynamically
        color: "white"
        font.bold: true
        x: 80
        y: 80
        font.pixelSize: 20
        anchors.centerIn: parent
    }

    TextField {
        x:60
        y:120
        id: nameInput
        placeholderText: "Enter your name"
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
    }

    Button {
        text: "Print Certificate"
        anchors {
            bottom: nameInput.top
            horizontalCenter: parent.horizontalCenter
        }

        onClicked: {
            nameLabel.text = nameInput.text;

            // Pass the inputted text to the certi_download.qml
            stackView.push("qrc:/certi_download.qml", { "name": nameInput.text });
        }
    }
}
