import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.msg, required this.isCurrentUser});
  final String msg;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: isCurrentUser
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  topLeft: Radius.circular(5))
              : BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5)),
          color: isCurrentUser
              ? AppColors.primaryColor
              : AppColors.textFormFieldfillColor,
        ),
        child: Text(msg,
            style: isCurrentUser
                ? msgTextStyle.copyWith(color: AppColors.secColor)
                : msgTextStyle.copyWith(color: AppColors.headingStyleColor)),
      ),
    );
  }
}
