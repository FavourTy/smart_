import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.subtititle,
      required this.text});
  final String title;
  final String subtititle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundColor: AppColors.primaryColor,
      ),
      title: Text(title),
      titleTextStyle:
          homeTextStyle.copyWith(color: AppColors.headingStyleColor),
      subtitle: Text(subtititle),
      subtitleTextStyle: msgTextStyle,
      trailing: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(text, style: msgTextStyle),
            Icon(
              Icons.circle,
              size: 20,
              color: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
