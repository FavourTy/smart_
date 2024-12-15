import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/app_color.dart';

class GenderContainer extends StatefulWidget {
  const GenderContainer({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  State<GenderContainer> createState() => _GenderContainerState();
}

class _GenderContainerState extends State<GenderContainer> {
  // bool _isPressed = false;

  // void _toggleColor(){
  //   setState(() {
  //     if(_isPressed){
  //      _isPressed = true;
  //     }else{
  //       _isPressed = false;
  //     }
  //   });
  // }
  Color _containerColor = AppColor.scond;
  Color _textColor = AppColor.buttonColor;
  Color _IconColor = AppColor.buttonColor;

  void _toggleColor() {
    setState(() {
      _containerColor = _containerColor == AppColor.scond
          ? AppColor.buttonColor
          : AppColor.scond;
      _IconColor = _IconColor == AppColor.buttonColor
          ? AppColor.scond
          : AppColor.buttonColor;
      _textColor = _textColor == AppColor.buttonColor
          ? AppColor.scond
          : AppColor.buttonColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleColor,
      child: Container(
        height: 50,
        width: 175,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: _containerColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              widget.icon,
              color: _IconColor,
            ),
            Text(
              widget.text,
              style: TextStyle(color: _textColor),
            )
          ],
        ),
      ),
    );
  }
}
