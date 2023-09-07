import QtQuick 2.15
import "."
Item {


    id: blankScreen
    Connections{
        target: mouseArea
        function onClicked() {
            doTurnOn()
        }
    }
    Rectangle {
        color: "black"
        anchors.fill: parent
        visible: true
        MouseArea{
            id: mouseArea
            anchors.fill: parent
        }
    }
    onVisibleChanged: {
        console.log("Constants.headerTextPointSize=" + Constants.headerTextPointSize)
        console.log("Constants.headerHeight=" + Constants.headerHeight)
    }
}
