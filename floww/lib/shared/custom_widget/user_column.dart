
import 'package:flutter/material.dart';
import '../constants.dart';

class UserColumn extends StatelessWidget {
  const UserColumn({
    super.key,
    required this.text,
    required this.onTap,
    required this.image,
  });
  final String text;
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        CircleAvatar(
          radius: 27,
          backgroundImage: NetworkImage(image),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: userDisplayTextStyle,
        )
      ]),
    );
  }
}
