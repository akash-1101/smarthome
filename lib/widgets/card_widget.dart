import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CardW extends StatelessWidget {
  const CardW(this.body, {this.color, Key? key}) : super(key: key);
  final Widget body;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
          elevation: 1,
          color: color ?? Colors.transparent.withOpacity(0.2),
          shadowColor: color ?? Colors.transparent.withOpacity(0.2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ClipRect(
            // <-- clips to the 200x200 [Container] below
            child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: body),
          )),
    );
  }
}
