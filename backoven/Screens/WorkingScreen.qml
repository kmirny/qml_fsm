import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: workingScreen
    property QtObject stateObject
    property QtObject viewModel

    visible: stateObject.active

    Rectangle{
        id: background
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "blue" }
            GradientStop { position: 0.6; color: "darkblue" }
            GradientStop { position: 1.0; color: "lightblue" }
        }
    }

    Header {
        id: header
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: Constants.headerHeight
        viewModel: parent.viewModel
    }
    DataArea {
        id: dataArea
        stateObject: parent.stateObject
        anchors.bottom: footer.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
    }

    Footer {
        id: footer
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: Constants.footerHeight

        stateObject: parent.stateObject
    }
}
