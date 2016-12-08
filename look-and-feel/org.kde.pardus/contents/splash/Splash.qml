import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Rectangle {
    id: root
    color: "#111111"
    property string sliceColorFirst : "#cccccc"
    property string sliceColorSecond : "#cccccc"
    property string baseColor : root.color
    property int stage

    onStageChanged: {
        if (stage == 2) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.target = busyIndicator;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Image {
            id: logo
            property real size: units.gridUnit * 10
            anchors.centerIn: parent
            source: "images/pardus-head.svgz"
            sourceSize.width: size
            sourceSize.height: size
        }

        Item {
            id:busyIndicator
            width: units.gridUnit * 4
            height: busyIndicator.width
            anchors.top: logo.bottom
            anchors.topMargin: units.largeSpacing
            anchors.horizontalCenter: parent.horizontalCenter

            antialiasing: true
            smooth: true
            property int thick: busyIndicator.width / 10
            property int r: busyIndicator.width
            property int dura: 7200


            Slice {
                rad: busyIndicator.r
                animationDuration: busyIndicator.dura / 5
                thickness: busyIndicator.thick

            }
            Slice {
                rad: busyIndicator.r - busyIndicator.thick * 2
                animationDuration: busyIndicator.dura / 4
                thickness: busyIndicator.thick

            }
            Slice {
                rad: busyIndicator.r - busyIndicator.thick * 4
                animationDuration: busyIndicator.dura / 3
                thickness: busyIndicator.thick

            }
            Slice {
                rad: busyIndicator.r - busyIndicator.thick * 6
                animationDuration: busyIndicator.dura / 2
                thickness: busyIndicator.thick

            }
            Slice {
                rad: busyIndicator.r - busyIndicator.thick * 8
                animationDuration: busyIndicator.dura
                thickness: busyIndicator.thick

            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
