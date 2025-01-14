//step 4 weather repository
import 'package:flutter/foundation.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/services/network_services/weather_services.dart';

class WeatherRepository {
  //import ApiService
  final _apiService = ApiServices();
  //using dart records
  Future<({Weather? model, String? error})> fetchCurrentWeather() async {
//making api call
    final req = await _apiService.get(
        endpoint:
            "?lat=6.9149&lon=5.1478&appid=20a0f5a1ae1b409c32490d979c61823f&units=imperial");
    if (req.data != null) {
      if (kDebugMode) {
        print("data is ${req.data}");
      }
      return (model: Weather.fromJson(req.data), error: null);
    } else {
      if (kDebugMode) {
        print("error occured is:  ${req.error}");
      }
    }
    return (model: null, error: req.error);
  }
}
