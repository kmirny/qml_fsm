import QtQuick 2.15
import QtQml.StateMachine 6.4 as DSM
import "../ViewModel"
DSM.State {
    id: working

    property alias editTemperatureActive: editTemperature.active
    property alias isIdle: heatingOff.active

    initialState: heatingOff
    DSM.State
    {
        id: heatingOff
        DSM.SignalTransition{
            targetState: airHeating
            signal: doSelectMode
            guard: modeType === ViewModel.HeatingMode.AirCirculation
        }
        DSM.SignalTransition{
            targetState: topBottomHeating
            signal: doSelectMode
            guard: modeType === ViewModel.HeatingMode.TopBottomHeating
        }
    }

    DSM.State{
        id: heatingOn
        childMode: DSM.QState.ParallelStates

        DSM.SignalTransition{
            targetState: heatingOff
            signal: doStop
            onTriggered: heatingStopped()
        }

        DSM.State{
            id: heating
            DSM.State{
                id: airHeating
            }
            DSM.State{
                id: topBottomHeating
            }
            onEntered: console.log("--> heating")
            onExited: console.log("<-- heating")
        }
        DSM.State{
            id: parameters
            initialState: parametersIdle
            property QtObject viewModel
            onEntered: console.log("--> parameters")
            onExited: console.log("<-- parameters")
            DSM.State{
                id: parametersIdle
                DSM.SignalTransition{
                    targetState: editTemperature
                    signal: doEditTemperature
                    onTriggered: vm => viewModel = vm
                }
                onEntered: console.log("--> parametersIdle")
                onExited: console.log("<-- parametersIdle")
            }
            DSM.State{
                id: editTemperature
                DSM.SignalTransition{
                    targetState: parametersIdle
                    signal: doEditDone
                }
                onEntered: console.log("--> editTemperature")
                onExited: console.log("<-- editTemperature")
            }
        }
    }


}
