import QtQuick 2.15
import "../icons"
Item{
    id: heatingModeListItem
    property alias iconSource: icon.source
    property alias modeTitle: name.text
    anchors.left: parent.left
    anchors.leftMargin: 20
    Image{
        id: icon

        anchors.left: parent.left
    }
    Text{
        id: name
        anchors.left: icon.right
        anchors.leftMargin: 5
        anchors.verticalCenter: icon.verticalCenter

        font.pixelSize: Constants.heatingModeTextSize
        color: Constants.heatingModeTextColor
    }
}
