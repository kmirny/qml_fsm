pragma Singleton
import QtQuick 2.15

QtObject {
    id: viewModel
    readonly property string title: "Bake with us"
    property QtObject currentHeating

    property var heatingModes : []
    Component.onCompleted: {
        heatingModes.push(airCirculation)
        heatingModes.push(topBottomHeating)
    }

    // Define Heating mode enum
    enum HeatingMode {
        None,
        AirCirculation,
        TopBottomHeating
    }
    function stopHeating()
    {
        currentHeating = null
    }
    function getAllHeatingModes()
    {
        return new Array
    }

    function setCurrentHeating(mode){
        switch(mode)
        {
        case ViewModel.HeatingMode.AirCirculation:
            currentHeating = airCirculation
            break
        case ViewModel.HeatingMode.TobBottomHeating:
            currentHeating = topBottomHeating
            break
        default:
            console.log("Unknown heating mode provided")
        }
    }

    property QtObject airCirculation: QtObject{

        readonly property string title: "Air Circulation"
        readonly property string icon: "../icons/air_circulation.png"
        readonly property int modeType: ViewModel.HeatingMode.AirCirculation
        property int temperature: 150
        readonly property int min_temperature: 50
        readonly property int max_temperature: 250
    }
    property QtObject topBottomHeating: QtObject {

        readonly property string title: "Top/Bottom Heating"
        readonly property string icon: "../icons/top_bottom.png"
        readonly property int modeType: ViewModel.HeatingMode.TopBottomHeating
        property int temperature: 170
        readonly property int min_temperature: 70
        readonly property int max_temperature: 200
    }
}
