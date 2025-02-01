import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.msg, required this.isCurrentUser});
  final String msg;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: isCurrentUser
            ? BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10))
            : BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10)),
        color:
            isCurrentUser ? AppColors.primaryColor : AppColors.newsLetterColor,
      ),
      child: Text(msg,
          style: isCurrentUser
              ? msgTextStyle.copyWith(color: AppColors.secColor)
              : msgTextStyle.copyWith(color: AppColors.headingStyleColor)),
    );
  }
}
