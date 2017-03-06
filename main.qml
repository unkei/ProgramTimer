import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property  double startTime: 0

    MainForm {
        id: mainForm
        anchors.fill: parent
        mouseArea.onClicked: {
            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
        }
        startButtonMouseArea.onClicked: {
            if (state == "started") {
                state = ""
                counterTimer.stop()
            } else {
                state = "started"
                startTime = new Date().getTime()
                setCounter()
                counterTimer.start()
            }
        }
    }

    function pad(n) {
        return (n < 10)? "0" + n: "" + n
    }

    function setCounter() {
        var counter_ms = new Date().getTime() - startTime
        console.log(counter_ms)
        var counter_h = Math.floor(counter_ms / 3600000)
        var counter_m = Math.floor((counter_ms % 3600000) / 60000)
        var counter_s = Math.floor(((counter_ms % 3600000) % 60000) / 1000)
        mainForm.counter = pad(counter_h) + ":" + pad(counter_m) + ":" + pad(counter_s)
    }

    function alert() {
        var counter_ms = new Date().getTime() - startTime
        var counter_s = Math.floor(counter_ms / 1000)
//        console.log(counter_s + " sec")
        var c1 = 30 // first alert 30 sec after start/c2
        var c2 = 20 // second alert 20 sec after c1
        var cycle = c1 + c2
        var counter_s_1 = counter_s - c1
        var counter_s_2 = counter_s - (c1 + c2)
        if (counter_s_1 % cycle == 0) {
            console.log("30 sec passed!")
        } else if(counter_s_2 % cycle == 0) {
            console.log("50 sec passed!")
        }
    }

    Timer {
        id: counterTimer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            setCounter()
            alert()
        }
    }
}
