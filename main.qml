import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    visible: true
    width: 350
    height: 600
    title: "page"

    StackView {
        id: stackView
        initialItem: "qrc:/pages/intropage.qml"
    }
}
