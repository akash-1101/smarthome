import 'package:flutter/material.dart';

class CardW extends StatelessWidget {
  const CardW(this.body, {this.color, Key? key}) : super(key: key);
  final Widget body;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Card(
        color: color ?? Colors.white24,
        shadowColor: color ?? Colors.white24,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: body,
      ),
    );
  }
}
