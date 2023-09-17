import QtQuick 2.15

Rectangle {
    id: editTemperature
    property QtObject viewModel

    color: "black"

    Connections{
        target: areaMinusButton
        enabled: viewModel
        function onClicked(){
            viewModel.decTemperature()
        }
    }
    Connections{
        target: areaPlusButton
        enabled: viewModel
        function onClicked(){
            viewModel.incTemperature()
        }
    }

    Text{
        id: title
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.right: parent.right
        //verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: "Set temperature"
        color: "white"
        font.pixelSize: 40
    }
    Item{
        anchors.verticalCenter: parent.verticalCenter
        anchors.top: title.bottom
        anchors.topMargin: 10
        width: parent.width
        height: 90

        Rectangle{
            id: minusButton
            color: "black"
            border.color: "white"
            anchors.left: parent.left
            anchors.right: editValue.left
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.top: editValue.top
            anchors.bottom: editValue.bottom
            Text{
                anchors.centerIn: parent
                text: "-"
                color: "white"
                font.pixelSize: 70
            }
            MouseArea{
                id: areaMinusButton
                anchors.fill: parent
            }
        }

        Rectangle{
            id: editValue
            color: "orange"
            border.color: "yellow"
            width: 180
            height: 90

            anchors.centerIn: parent
            Text{
                anchors.centerIn: parent
                verticalAlignment: Text.AlignVCenter
                text:  viewModel.temperature + "°C"
                color: "white"
                font.pixelSize: 60
            }
        }

        Rectangle{
            id: plusButton
            color: "black"
            border.color: "white"
            anchors.right: parent.right
            anchors.left: editValue.right
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.top: editValue.top
            anchors.bottom: editValue.bottom
            Text{
                anchors.centerIn: parent
                text: "+"
                color: "white"
                font.pixelSize: 70
            }
            MouseArea{
                id: areaPlusButton
                anchors.fill: parent
            }
        }

    }
    Rectangle {
        id: buttonClose
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5
        width: 150
        height: 75
        border.width: 2
        border.color: "white"
        radius: 20
        color: "blue"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                doEditDone()
            }
        }
        Text {
            anchors.centerIn: parent
            text: "OK"
            color: "white"
            font.pixelSize: Constants.footerButtonTextSize
        }
    }

}
