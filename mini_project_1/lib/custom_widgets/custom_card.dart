import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/app_color.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  int _numb = 0;
  void _toggleNumb() {
    setState(() {
      _numb++;
    });
  }

  void _decreaseNum() {
    setState(() {
      _numb--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      width: 175.0,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: AppColor.scond,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.text),
              const SizedBox(
                height: 30,
              ),
              Text("$_numb"),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _toggleNumb,
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: AppColor.scond,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _decreaseNum,
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: AppColor.scond,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
