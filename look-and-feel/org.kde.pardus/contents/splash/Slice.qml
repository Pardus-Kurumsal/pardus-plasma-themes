import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Item {
    id: slice
    property int rad : 100
    property string sliceColorFirst : root.sliceColorFirst ? root.sliceColorFirst : "#cccccc" // "#222222"
    property string sliceColorSecond : root.sliceColorSecond ? root.sliceColorSecond : "#cccccc" // "yellow"
    property string baseColor : root.baseColor ? root.baseColor : "black"
    property int animationDuration : 6000
    property int thickness : 6
    anchors.centerIn: parent
    height: parent.rad ? parent.rad - thickness * 2 : rad
    width: slice.height
    antialiasing: true
    smooth: true
    visible: true
    Canvas {
        id:outer
        anchors.fill: parent
        antialiasing: true
        smooth: true
        height: slice.height
        width: outer.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            var centreX = outer.height / 2;
            var centreY = outer.height / 2;

            ctx.beginPath();
            ctx.fillStyle = sliceColorFirst;
            ctx.moveTo(centreX, centreY);
            ctx.arc(centreX, centreY, outer.height / 2, Math.PI * 5 / 4, Math.PI * 7 / 4, false);
            ctx.lineTo(centreX, centreY);
            ctx.fill();

            ctx.beginPath();
            ctx.fillStyle = sliceColorSecond;
            ctx.moveTo(centreX, centreY);
            ctx.arc(centreX, centreY, outer.height / 2, Math.PI / 4, Math.PI * 3 / 4, false);
            ctx.lineTo(centreX, centreY);
            ctx.fill();

        }

        Rectangle {
            id:inner
            anchors.centerIn: parent
            antialiasing: true
            smooth: true
            height: outer.height - thickness
            width: inner.height
            radius: inner.height / 2
            color: baseColor
        }

    }

    NumberAnimation on rotation{
        duration: animationDuration
        from: 0
        to: 360
        loops: Animation.Infinite
    }

}
