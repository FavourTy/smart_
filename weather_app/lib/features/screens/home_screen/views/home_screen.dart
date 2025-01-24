import 'package:flutter/material.dart';
import 'package:weather_app/features/custom_widgets/custom_container.dart';
import 'package:weather_app/shared/app_colors.dart';
import 'package:weather_app/shared/constants.dart';

import '../../../../repository/weather_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hola Pebbles",
                style: headingTextSd,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Discover the weather🥰",
                style: headingTextSd,
              ),
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                  future: WeatherRepository().fetchCurrentWeather(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.data?.error != null) {
                      return Text(
                          snapshot.data?.error ?? "Emabinu no weather data");
                    }
                    return CustomWeatherCard(
                        country: snapshot.data!.model?.sys.country ?? "",
                        weatherType: snapshot.data?.model!.weather.firstOrNull
                                ?.description ??
                            "",
                        temp: temp);
                  }),
              // CustomWeatherCard(
              //     country: "Canada", weatherType: "Feels Sunny", temp: 17),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Around the world",
                style: headingTextSd,
              ),
              const SizedBox(height: 20),
              const CustomWeatherCard(
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
