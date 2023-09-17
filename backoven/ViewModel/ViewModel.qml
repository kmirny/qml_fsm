pragma Singleton
import QtQuick 2.15

QtObject {
    id: viewModel
    readonly property string title: "Bake with us"
    property QtObject currentHeating

    onCurrentHeatingChanged: console.log("ViewModel: new currentHeating:" + currentHeating)
    property var heatingModes : []
    Component.onCompleted: {
        heatingModes.push(airCirculation)
        heatingModes.push(topBottomHeating)
    }

    // Define Heating mode enum
    enum HeatingMode {
        AirCirculation = 1,
        TopBottomHeating = 2
    }
    function stopHeating()
    {
        currentHeating.running = false
        currentHeating.currentTemperature = 20
        currentHeating = null
    }

    function setCurrentHeating(mode){
        switch(mode)
        {
        case 1: //ViewModel.HeatingMode.AirCirculation:
            currentHeating = airCirculation
            break
        case 2: //ViewModel.HeatingMode.TobBottomHeating:
            currentHeating = topBottomHeating
            break
        default:
            console.log("Unknown heating mode provided: " + mode)
        }
        if (currentHeating)
        {
            currentHeating.running = true
        }
    }

    property QtObject airCirculation: QtObject{

        readonly property string title: "Air Circulation"
        readonly property string icon: "../icons/air_circulation.png"
        readonly property int modeType: ViewModel.HeatingMode.AirCirculation
        property int temperature: 150
        property int currentTemperature: 20
        readonly property int min_temperature: 50
        readonly property int max_temperature: 250
        property alias running: temperatureTimer.running
        property Timer temperatureTimer: Timer{
            id: temperatureTimer
            interval: 100
            running: false
            repeat: true
            onTriggered: if (parent.currentTemperature != parent.temperature) {
                parent.currentTemperature -= Math.abs(parent.currentTemperature - parent.temperature) / (parent.currentTemperature - parent.temperature)
            }
        }
        function incTemperature()
        {
            if (temperature < max_temperature) temperature++
        }
        function decTemperature()
        {
            if (temperature > min_temperature) temperature--
        }
    }
    property QtObject topBottomHeating: QtObject {

        readonly property string title: "Top/Bottom Heating"
        readonly property string icon: "../icons/top_bottom.png"
        readonly property int modeType: ViewModel.HeatingMode.TopBottomHeating
        property int temperature: 170
        property int currentTemperature: 20
        readonly property int min_temperature: 70
        readonly property int max_temperature: 200
        property alias running: temperatureTimer1.running
        property Timer temperatureTimer: Timer{
            id: temperatureTimer1
            interval: 100
            running: false
            repeat: true
            onTriggered: if (parent.currentTemperature != parent.temperature) {
                parent.currentTemperature -= Math.abs(parent.currentTemperature - parent.temperature) / (parent.currentTemperature - parent.temperature)
            }
        }
        function incTemperature()
        {
            if (temperature < max_temperature) temperature++
        }
        function decTemperature()
        {
            if (temperature > min_temperature) temperature--
        }
    }
}
