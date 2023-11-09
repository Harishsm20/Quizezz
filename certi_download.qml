import QtQuick 2.0
import QtQuick.Controls 2.12


//ApplicationWindow {
//    visible: true
//    width: 700
//    height: 600
//    title: "page"


Rectangle {
    width: 550
    height: 600
    color: "white"
    x:50

    property string name: ""

    Image {
        id: certificateImage
        source: "qrc:/assets/certificate.png" // Replace with the path to your certificate image
        anchors.centerIn: parent
        width: 600 // Set the width of the image
        height: 400 // Set the height of the image
    }

    Text {
        id: nameLabel // Rename this id to nameLabel
        text: name // Display the inputted text here
        color: "white"
        font.bold: true
        font.pixelSize: 20

        x: 260
        y: 335
    }
}


