import QtQuick 2.15
import QtQuick.Layouts 1.3
import "../icons"
Item {
    id: chooseModeScreen
    property QtObject viewModel
    onVisibleChanged: {
        console.log("modes:" + viewModel.heatingModes)
    }
    Rectangle{
        anchors.fill: parent
        color: "grey"
        opacity: 0.5
        border.color: "yellow"
    }
    Text{
        id: chooseModeTitle
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter
        text: Constants.labelChooseMode
        font.pixelSize: Constants.chooseModeTextSize
        color: Constants.chooseModeTextColor
    }
    Item {
        id: modesList
        anchors.top: chooseModeTitle.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right


        ColumnLayout {

            Repeater{
                model: viewModel.heatingModes
                delegate:
                    HeatingModeListItem {
                        iconSource: modelData.icon
                        modeTitle: modelData.title
                        modeType: modelData.modeType
                        onSelected: modeType => {
                            console.log("ChooseModeScreen: selected mode type:" + modeType)
                            viewModel.setCurrentHeating(modeType)
                            doSelectMode(modeType)
                        }
                }
            }
        }

    }

}
