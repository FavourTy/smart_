import 'package:flutter/material.dart';
import 'package:weather_app/shared/app_assets.dart';
import 'package:weather_app/shared/app_colors.dart';
import 'package:weather_app/shared/constants.dart';

class CustomWeatherCard extends StatelessWidget {
  const CustomWeatherCard(
      {super.key,
      this.location,
      required this.country,
      required this.weatherType,
      required this.temp});
  final String? location;
  final String country;
  final String weatherType;
  final num temp;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Column(
            children: [
              Text(location ?? "Current Location", style: containerTextStyle),
              SizedBox(
                height: 10,
              ),
              Text(country,
                  style: containerTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 28.0,
                  )),
              SizedBox(
                height: 30,
              ),
              Text(weatherType,
                  style: containerTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 28.0,
                  )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(temp > 50
                  ? AppAssets.drizzlingPng
                  : temp > 20
                      ? AppAssets.snowyPng
                      : temp > 100
                          ? AppAssets.stormyPng
                          : temp > 100
                              ? AppAssets.sunnyPng
                              : ""),
              SizedBox(
                height: 30,
              ),
              Text(
                temp.toString(),
                style: containerTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
