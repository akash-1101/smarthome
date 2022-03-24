import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SwitchW extends StatelessWidget {
  const SwitchW(this.value, this.onChanged, {Key? key}) : super(key: key);
  final bool value;
  final void Function(bool value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        value: value, activeColor: HexColor("#ff9b75"), onChanged: onChanged);
  }
}
