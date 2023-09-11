import QtQuick 2.15

Rectangle {
    id: temperatureControl
    property QtObject viewModel

    signal edit(QtObject vm)
    border.color: "white"
    border.width: 2
    color: "transparent"
    radius: 20

    MouseArea{
        anchors.fill: parent
        onClicked: edit(viewModel)
    }

    Text{
        id: currentTemperature
        anchors.centerIn: parent
        anchors.topMargin: 20
        text: temperatureControl.viewModel.currentTemperature + "°C"
        color: "white"
        font.pixelSize: 60

    }
    Text{
        id: desiredTemperature
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 10
        anchors.topMargin: 5
        text: temperatureControl.viewModel.temperature + "°C"
        color: Math.abs(temperatureControl.viewModel.temperature - temperatureControl.viewModel.currentTemperature) > 5 ? "white" : "green"
        font.pixelSize: 30

    }
    onVisibleChanged: {
        if(visible) console.log("TemperatureControl.currentTemperature: " + temperatureControl.viewModel.currentTemperature )
    }
}
