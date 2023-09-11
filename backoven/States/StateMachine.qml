import QtQuick 2.15
import QtQml.StateMachine 6.4 as DSM
import "."


DSM.StateMachine {
    id: stateMachine
    running: true
    property alias editValueActive: stateWorking.editTemperatureActive
    property alias workingState: stateWorking
    property alias stanbdyActive: stateStandby.active

    signal heatingStopped()

    initialState: stateStandby
    DSM.State{
        id: stateStandby
        DSM.SignalTransition{
            targetState: stateWorking
            signal: doTurnOn
        }
        onEntered: console.log("--> Entered Standby")
        onExited: console.log("<-- Exited Standby")
    }
    Working{
        id: stateWorking
        DSM.SignalTransition{
            targetState: stateStandby
            signal: doStandby
        }
    }
}
