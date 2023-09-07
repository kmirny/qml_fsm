import QtQuick 2.15
import QtQuick.Controls 2.15

Item{
    id: footer
    property QtObject stateObject
    Item{
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5
        width: 150
        height: 75
        Rectangle {
            id: buttonTurnOff
            visible: stateObject.isIdle
            anchors.fill: parent
            border.width: 2
            border.color: "white"
            radius: 20
            color: "blue"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    doStandby()
                }
            }
            Text {
                anchors.centerIn: parent
                text: Constants.labelTurnOff
                color: "white"
                font.pixelSize: Constants.footerButtonTextSize
            }
        }
        Rectangle {
            id: buttonStop
            visible: !stateObject.isIdle
            anchors.fill: parent
            border.width: 2
            border.color: "white"
            radius: 20
            color: "Yellow"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    doStop()
                }
            }
            Text {
                anchors.centerIn: parent
                text: Constants.labelStop
                color: "white"
                font.pixelSize: Constants.footerButtonTextSize
            }
        }
    }


}
