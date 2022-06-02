import 'package:flutter/material.dart';

class CircleAvatarView extends StatelessWidget {
  double avatarSize;
  String accountFirstChar;
  Color bgColor;

  CircleAvatarView({double size, String char, Color color}) {
    avatarSize = size <= 0 ? 35 : size;
    accountFirstChar = char.isEmpty ? "t" : char;
    bgColor = color != null ? color : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
          color: bgColor, // button color
          child: SizedBox(
            width: avatarSize,
            height: avatarSize,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "$accountFirstChar",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          )),
    );
  }
}
