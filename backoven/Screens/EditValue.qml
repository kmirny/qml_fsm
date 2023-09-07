import QtQuick 2.15

Item {
    id: editValue

    property QtObject viewModel
    property string title: viewModel ? viewModel.title: "---"
    property string subtitle: viewModel ? viewModel.subtitle: "---"
    property int min: viewModel ? viewModel.min: 0
    property int max: viewModel ? viewModel.max: 0


}
