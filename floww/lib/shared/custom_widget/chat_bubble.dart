import 'package:floww/shared/app_colors.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.msg, required this.isCurrentUser});
  final String msg;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isCurrentUser ? AppColors.primaryColor : AppColors.newsLetterColor,
      ),
      child: Text(msg),
    );
  }
}
