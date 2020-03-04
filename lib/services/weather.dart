
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey= '34b2fc8f8edf22a516727722586d4b6f';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {


  double latitude;
  double longitude;

  Future<dynamic> getCityWeather(String cityName) async{

    var url = '$openWeatherMapUrl?q=$cityName&appId=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
   var weatherData = await networkHelper.getData();
   return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
