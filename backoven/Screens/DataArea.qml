import QtQuick 2.15

Item{
    id: dataArea
    property QtObject stateObject
    property QtObject viewModel

    // Choose heating mode
    ChooseModeScreen
    {
        id: chooseModeScreen
        anchors.fill: parent
        visible: stateObject.isIdle
        viewModel: parent.viewModel
    }

    // Show heating screen
    HeatingScreen{
        id: heatingScreen
        anchors.fill: parent
        visible: !dataArea.stateObject.isIdle
        stateObject: dataArea.stateObject
        viewModel: parent.viewModel.currentHeating
    }
}
