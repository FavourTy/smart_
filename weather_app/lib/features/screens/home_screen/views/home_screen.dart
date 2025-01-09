import 'package:flutter/material.dart';
import 'package:weather_app/features/custom_widgets/custom_container.dart';
import 'package:weather_app/shared/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hola Pebbles",
                style: headingTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Discover the weather🥰",
                style: headingTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              CustomWeatherCard(
                  country: "Canada", weatherType: "Feels Sunny", temp: 17),
              Text(
                "Around the world",
                style: headingTextStyle,
              ),
              SizedBox(height: 20),
              CustomWeatherCard(
                  location: "Ottawa",
                  country: "Canada",
                  weatherType: "Feels Sunny",
                  temp: 17)
            ],
          ),
        ),
      )),
    );
  }
}
