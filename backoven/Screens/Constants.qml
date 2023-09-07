pragma Singleton
import QtQuick 2.15

QtObject {
    readonly property int headerHeight: 75
    readonly property int footerHeight: 75
    readonly property double headerTextPointSize: 50
    readonly property double headerTimeFieldWidth: 200
    readonly property color headerTextColor : "white"
    readonly property double footerButtonTextSize: 30


    // labels
    readonly property string labelTurnOff: "Turn Off"
    readonly property string labelStop: "Stop"
}
