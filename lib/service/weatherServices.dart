import 'package:weatherapp/api/apirebo.dart';
import 'package:weatherapp/model/currentWeather.dart';
import 'package:weatherapp/model/five_days_data.dart';


class WeatherService {
  final String city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=dcc6b3905eca8dd0a0039e2c1ae1d4e7';


  WeatherService({required this.city});

  void getCurrentWeatherData({
    Function()? beforSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    ApiRepository(
      url: '$url',
    ).get(
        beforeSend: () => {
              if (beforSend != null)
                {
                  beforSend(),
                },
            },
        onSuccess: (data) => {
              onSuccess!(CurrentWeatherData.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  // ignore: avoid_print
                  print(error),
                  onError(error),
                }
            });
  }

void getFiveDaysThreeHoursForcastData({
    Function()? beforSend,
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    // ignore: avoid_print
    print(url);
    ApiRepository(
      // ignore: unnecessary_string_interpolations
      url: '$url',
    ).get(
        beforeSend: () => {},
        onSuccess: (data) => {
              onSuccess!((data['list'] as List)
                  .map((t) => FiveDayData.fromJson(t))
                  .toList())
            },
        onError: (error) => {
              // ignore: avoid_print
              print(error),
              onError!(error),
            });
  }
 
}
