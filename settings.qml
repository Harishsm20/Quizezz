import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Settings Page"

    Rectangle {
        color: "lightgray"
        anchors.fill: parent

        Column {
            spacing: 10
            anchors.centerIn: parent

            // Brightness Control
            Text {
                text: "Brightness Control"
                font.pixelSize: 18
            }

            Slider {
                width: parent.width
                from: 0
                to: 100
                stepSize: 1
                value: 50 // Initial brightness value
                onValueChanged: {
                     platform.setBrightness(value)
                    // Handle brightness change here
                    // You can connect this to your system's brightness control
                    console.log("Brightness changed to: " + value)
                }
            }

            // Basic Settings
            Text {
                text: "Basic Settings"
                font.pixelSize: 18
            }

            CheckBox {
                text: "Enable Notifications"
                checked: true // Initial state
                onCheckedChanged: {
                    // Handle notification setting change here
                    console.log("Notifications enabled: " + checked)
                }
            }



            // Save Button
            Button {
                text: "Save"
                width: parent.width
                onClicked: {
                    // Save all settings here
                    console.log("Settings saved.")
                }
            }
        }
    }
}
