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

    QtObject {
        id: stateMachineMock
        property bool editValueActive: false
        property bool stanbdyActive: true
        property QtObject workingState: QtObject {
            property bool editTemperatureActive: false
            property bool isIdle: false
        }

        //Outgoing signal
        signal heatingStopped

        //Incoming signals
        function doTurnOn()
        {
            doTurnOnReceived()
        }

        function doStandby()
        {
            doStandbyReceived()
        }

        function doSelectMode()
        {
            doSelectModeReceived()
        }

        function doStop()
        {
            doStopReceived()
        }

        function doEditTemperature()
        {
            doEditTemperatureReceived()
        }

        function doEditDone()
        {
            doEditDoneReceived()
        }

        signal doTurnOnReceived
        signal doStandbyReceived
        signal doSelectModeReceived
        signal doStopReceived
        signal doEditTemperatureReceived
        signal doEditDoneReceived

    }

    // Visual Components
    BlankScreen{
        anchors.fill: parent
        // connection to the state machine
        visible: stateMachine.stanbdyActive
    }

    WorkingScreen{
        anchors.fill: parent
        // hold the state of the state machine
        stateObject: stateMachine.workingState
        viewModel: ViewModel
    }
}
