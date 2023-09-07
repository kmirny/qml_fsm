pragma Singleton
import QtQuick 2.15

QtObject {
    readonly property int       headerHeight: 75
    readonly property int       footerHeight: 75
    readonly property double    headerTextPointSize: 50
    readonly property double    headerTimeFieldWidth: 200
    readonly property color     headerTextColor : "white"
    readonly property double    footerButtonTextSize: 30

    readonly property double    chooseModeTextSize: 35
    readonly property color     chooseModeTextColor: "white"
    readonly property double    heatingModeTextSize: 30
    readonly property color     heatingModeTextColor: "white"
    // labels
    readonly property string labelTurnOff: "Turn Off"
    readonly property string labelStop: "Stop"
    readonly property string labelAirCirculation: "Air Circulation"
    readonly property string labelTopBottomHeating: "Top/Bottom Heating"
    readonly property string labelChooseMode: "Choose Heating Mode:"

    // icons
    readonly property string iconAirCirculation: "../icons/air_circulation.png"
    readonly property string iconTopBottomHeating: "../icons/top_bottom.png"
}
