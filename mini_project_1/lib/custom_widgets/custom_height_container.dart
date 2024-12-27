import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/app_color.dart';
import 'package:mini_project_1/shared/constants.dart';

class Heightcontainer extends StatefulWidget {
  const Heightcontainer({super.key, required this.value, this.onchanged});
  final double value;
  final void Function(double)? onchanged;

  @override
  State<Heightcontainer> createState() => _HeightcontainerState();
}

class _HeightcontainerState extends State<Heightcontainer> {
  final double min = 0;
  final double max = 230;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 466,
      width: 170,
      decoration: BoxDecoration(
          color: AppColor.scond,
          borderRadius: BorderRadius.circular(circularRadius)),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliderTheme(
              data: const SliderThemeData(
                trackHeight: 15,
              ),
              child: RotatedBox(
                quarterTurns: 3,
                child: Slider(
                  value: widget.value,
                  min: min,
                  max: max,
                  onChanged: widget.onchanged,
                  activeColor: AppColor.buttonColor,
                  inactiveColor: AppColor.backgroundColor,
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Height',
                style: normalTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${widget.value.round()}',
                style: intTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
