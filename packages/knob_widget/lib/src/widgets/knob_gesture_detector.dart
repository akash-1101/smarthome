import 'package:flutter/material.dart';
import 'package:knob_widget/src/controller/knob_controller.dart';
import 'package:knob_widget/src/utils/polar_coordinate.dart';
import 'package:knob_widget/src/widgets/control_knob.dart';

import 'package:knob_widget/src/widgets/radial_drag_gesture_detector.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class KnobGestureDetector extends StatefulWidget {
  const KnobGestureDetector({
    Key? key,
  }) : super(key: key);

  @override
  _KnobGestureDetectorState createState() => _KnobGestureDetectorState();
}

class _KnobGestureDetectorState extends State<KnobGestureDetector> {
  _onRadialDragStart(PolarCoordinate coordinate) {}

  _onRadialDragUpdate(PolarCoordinate coordinate) {
    var controller = Provider.of<KnobController>(context, listen: false);
    var angle = coordinate.angle;
    var value = controller.getValueOfAngle(angle);
    controller.setCurrentValue(value);
  }

  onRadialDragEnd() {}

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<KnobController>(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        RadialDragGestureDetector(
          onRadialDragStart: _onRadialDragStart,
          onRadialDragUpdate: _onRadialDragUpdate,
          onRadialDragEnd: onRadialDragEnd,
          child: ControlKnob(
            controller.getAngleOfValue(controller.value.current) / 360,
          ),
        ),
        RadialDragGestureDetector(
            onRadialDragStart: _onRadialDragStart,
            onRadialDragUpdate: _onRadialDragUpdate,
            onRadialDragEnd: onRadialDragEnd,
            child: Material(
                elevation: 10,
                shape: const CircleBorder(),
                child: Container(
                  padding: const EdgeInsets.all(60),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          offset: Offset(0.0, 1.0),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        controller.value.current.toInt().toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 60),
                      ),
                      const Text(
                        "\u2103",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ))),
      ],
    );
  }
}
