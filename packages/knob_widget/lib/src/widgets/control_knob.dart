import 'package:flutter/material.dart';
import 'package:knob_widget/src/utils/knob_style.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'circle_tick_painter.dart';

class ControlKnob extends StatelessWidget {
  final double rotation;
  const ControlKnob(
    this.rotation, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Provider.of<KnobStyle>(context);
    return Transform(
      transform: Matrix4.rotationZ(2 * pi * rotation),
      alignment: Alignment.center,
      child: Material(
        elevation: 10,
        shape: const CircleBorder(),
        shadowColor: style.controlStyle.shadowColor,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: style.controlStyle.backgroundColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: style.controlStyle.glowColor,
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0.0, 1.0),
                )
              ]),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(style.pointerStyle.offset),
              child: SizedBox(
                height: style.pointerStyle.height,
                width: style.pointerStyle.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.arrow_drop_up_sharp,
                      size: 40,
                    ),
                    Icon(
                      Icons.circle,
                      size: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
