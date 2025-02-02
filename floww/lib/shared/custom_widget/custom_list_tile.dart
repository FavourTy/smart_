import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.subtititle,
      required this.text,
      required this.onTap,
      required this.image});
  final String title;
  final String subtititle;
  final String text;
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: NetworkImage(image),
      ),
      title: Text(title),
      titleTextStyle:
          homeTextStyle.copyWith(color: AppColors.headingStyleColor),
      subtitle: Text(
        subtititle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitleTextStyle: msgTextStyle,
      trailing: Text(text, style: msgTextStyle),
    );
  }
}
