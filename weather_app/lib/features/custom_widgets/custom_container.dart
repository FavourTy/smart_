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
  final int temp;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 25,
                ),
                Text(weatherType,
                    style: containerTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 28.0,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    temp > 50
                        ? AppAssets.drizzlingPng
                        : temp > 5
                            ? AppAssets.snowyPng
                            : temp > 100
                                ? AppAssets.stormyPng
                                : temp > 100
                                    ? AppAssets.sunnyPng
                                    : "",
                    height: 80,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "${temp}",
                    style: containerTextStyle,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
