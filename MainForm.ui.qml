import QtQuick 2.5

Rectangle {
    id: _root
    property alias mouseArea: mouseArea
    property alias startButtonMouseArea : startButtonMouseArea
    property alias rectangle2: rectangle2

    width: 360
    height: 360
    property string counter: "00:00:00"

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    Rectangle {
        id: rectangle
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            color: "#ffffff"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: rectangle2.top
            anchors.left: parent.left

            Text {
                id: counterLabel
                text: _root.counter
                font.family: "Tahoma"
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 64
            }
        }

        Rectangle {
            id: rectangle2
            color: "#00ff00"
            height: 96
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: parent.left

            Text {
                id: startButton
                color: "#ffffff"
                text: qsTr("start")
                styleColor: "#000000"
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 48
            }

            MouseArea {
                id: startButtonMouseArea
                anchors.fill: parent
            }
        }
    }
    states: [
        State {
            name: "started"

            PropertyChanges {
                target: rectangle2
                color: "#ff0000"
            }

            PropertyChanges {
                target: startButton
                text: qsTr("stop")
            }
        }
    ]
}
