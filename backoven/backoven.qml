import QtQuick 2.15
import QtQuick.Window 2.15
import "Screens"
import "States"
import "ViewModel"

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Abstract Baking Oven")

    signal doTurnOn
    signal doStandby

    signal doSelectMode(int modeType)
    signal doStop
    signal doEditDone
    signal doEditTemperature(QtObject vm)

    Connections{
        target: stateMachine
        function onHeatingStopped()
        {
            ViewModel.stopHeating()
        }
    }

    // State Machine
    StateMachine{
        id: stateMachine
    }

    // Visual Components
    BlankScreen{
        anchors.fill: parent
        visible: stateMachine.stanbdyActive
    }

    WorkingScreen{
        anchors.fill: parent
        stateObject: stateMachine.workingState
        viewModel: ViewModel
    }

    EditValue{
        visible: stateMachine.editValueActive
    }
    

}
