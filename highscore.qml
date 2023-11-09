import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    width: 350
    height: 600

    Text {
            text: "Technical High Score: " + Register.getTechnicalHighScore(username)
            font.pixelSize: 18
            color: "white"
            anchors.centerIn: parent
        }

    // ... (other parts of highscore.qml)
}
