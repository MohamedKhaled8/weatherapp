import 'package:get/get_state_manager/get_state_manager.dart';
import '../model/currentWeather.dart';
import '../service/weatherServices.dart';
import '/model/five_days_data.dart';


class HomeController extends GetxController {
  String? city;
  String? searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  HomeController({required this.city , });

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) => {
          print(error),
          update(),
        });
  }

  void getTopFiveCities() {
    List<String> cities = [
      'cairo',
      'zagazig',
      'alexandria',
      'ismailia',
      'fayoum'
    ];
    for (var c in cities) {
      WeatherService(city: '$c').getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        // ignore: avoid_print
        print(error);
        update();
      });
    }
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        }, onError: (error) {
      // ignore: avoid_print
      print(error);
      update();
    });
  }
}
