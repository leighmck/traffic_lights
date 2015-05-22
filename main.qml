import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true

    Item {
        id: root

        property color black: "black"
        property color green: "green"
        property color red: "red"

        Rectangle {
            id: light1
            x: 25
            y: 15
            width: 100
            height: width
            radius: width / 2
            color: root.black
            border.color: Qt.lighter(color, 1.1)
        }
        Rectangle {
            id: light2
            x: 25
            y: 135
            width: 100
            height: width
            radius: width / 2
            color: root.black
            border.color: Qt.lighter(color, 1.1)
        }

        states: [
            State {
                name: "stop"
                PropertyChanges {
                    target: light1
                    color: root.red
                }
                PropertyChanges {
                    target: light2
                    color: root.black
                }
            },
            State {
                name: "go"
                PropertyChanges {
                    target: light1
                    color: root.black
                }
                PropertyChanges {
                    target: light2
                    color: root.green
                }
            }
        ]

        state: "stop"

        transitions: [
            Transition {
                from: "stop"
                to: "go"
                // from: "*"; to: "*"
                ColorAnimation {
                    target: light1
                    properties: "color"
                    duration: 2000
                }
                ColorAnimation {
                    target: light2
                    properties: "color"
                    duration: 2000
                }
            }
        ]
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.state = (root.state == "stop" ? "go" : "stop")
    }
}
