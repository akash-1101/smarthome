import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  const ListTileWidget(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListTile(
          leading: const MyBullet(),
          minVerticalPadding: 0,
          contentPadding: const EdgeInsets.all(2),
          title: Transform.translate(
            offset: const Offset(-30, -4),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          )),
    );
  }
}

class MyBullet extends StatelessWidget {
  const MyBullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 12.0,
      width: 12.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
