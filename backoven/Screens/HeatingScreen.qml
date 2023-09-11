import QtQuick 2.15

Item {
    id: heatingScreen
    property QtObject viewModel // the view model contains the running heating mode
    Rectangle{
        anchors.fill: parent
        color: "orange"
        opacity: 0.5
    }
    Item {
        id: heatingModeData
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: modeIcon.height * 2
        Text{
            id: modeTitle
            text: viewModel.title
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            color: "white"
            font.pixelSize: 60
        }

        Image{
            id: modeIcon
            anchors.top: modeTitle.bottom
            anchors.topMargin: 10
            source: viewModel.icon
        }
        TemperatureControl
        {
            viewModel: heatingScreen.viewModel
            width: 200
            height: 150
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: modeIcon.top
        }

    }
}
