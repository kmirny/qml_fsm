import QtQuick 2.15
import QtQuick.Controls 2.15

import "./"
import "../ViewModel"

Item{
    id: header
    property QtObject viewModel
    Timer {
        id: timer
        interval: 1000 // Update every second
        running: true
        repeat: true
        onTriggered: {
            labelTime.text = new Date().toLocaleTimeString()
        }
    }
    Text {
        id: labelTitle
        text: viewModel.title
        font.pixelSize: Constants.headerTextPointSize
        color: Constants.headerTextColor
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.right: labelTime.left
        anchors.top: parent.top
    }

    Text {
        id: labelTime
        width: Constants.headerTimeFieldWidth
        color: Constants.headerTextColor
        font.pixelSize: Constants.headerTextPointSize
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignLeft
        text: new Date().toLocaleTimeString()
    }
}
