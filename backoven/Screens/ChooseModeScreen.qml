import QtQuick 2.15
import "../icons"
Item {
    id: chooseModeScreen
    Rectangle{
        anchors.fill: parent
        color: "grey"
        opacity: 0.5
        border.color: "yellow"
    }
    Text{
        id: chooseModeTitle
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter
        text: Constants.labelChooseMode
        font.pixelSize: Constants.chooseModeTextSize
        color: Constants.chooseModeTextColor
    }
    Item {
        id: modesList
        anchors.top: chooseModeTitle.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        Rectangle{
            anchors.fill: parent
            border.color: "orange"
            color: "transparent"
        }

        HeatingModeListItem {
            iconSource: Constants.iconAirCirculation
            modeTitle: Constants.labelAirCirculation
        }
    }

}
