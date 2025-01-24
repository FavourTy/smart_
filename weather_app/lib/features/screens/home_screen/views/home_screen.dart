import 'package:flutter/material.dart';
import 'package:weather_app/features/custom_widgets/custom_container.dart';
import 'package:weather_app/shared/app_colors.dart';
import 'package:weather_app/shared/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<double> latitudes = <double>[
    5.45409529947607,
    9.512977199417053,
    4.940863799511036,
    6.2183135994341985,
    10.622828399473097,
    4.762978599524332,
    7.35057469939717,
    12.18753919959776,
    5.867196599451846,
    5.527306099471514,
    6.199691799435065,
    6.607657499417959,
    7.736890999391845,
    6.553609399419997,
    8.831122799397733,
    8.831122799397733,
    5.585945599467946,
    12.325236199610885,
    10.382531799458487,
    11.894838899570903,
    12.563082499634245,
    11.416757399530335,
    7.79496019939138,
    8.836789099397848,
    6.526903299421034,
    8.438786799392046,
    9.932608299434758,
    6.978858199405861,
    7.0209685994047035,
    7.548404699393967,
    8.215124899390593,
    9.058344599402849,
    4.841602799518385,
    13.061119499685718,
    8.0141333993904,
    12.123324199591742,
    12.007899799581104,
  ];

  final List<double> Longitudes = <double>[
//21
    7.6207063,
    4.107454499999999,
    6.686866899999999,
    4.668848699999999,
    3.5774005,
    8.238284899999998,
    5.651108799999999,
    3.4389293,
    5.0567477,
    4.497830700000001,
    3.5642896999999993,
    9.6826289,
    6.8604088,
    5.3152203,
    10.737633599999999,
    11.506593699999998,
    6.4191432
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hola Pebbles",
                style: headingTextSd,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Discover the weather🥰",
                style: headingTextSd,
              ),
              SizedBox(
                height: 15,
              ),
              CustomWeatherCard(
                  country: "Canada", weatherType: "Feels Sunny", temp: 17),
              SizedBox(
                height: 20,
              ),
              Text(
                "Around the world",
                style: headingTextSd,
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
