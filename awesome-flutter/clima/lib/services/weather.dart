import './location.dart';
import './networking.dart';

const apiKey = "5b30ad0d1412920292065c692f8aa0da";
const openWeatherAppURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPositon();

    double _latitude = location.latitude;
    double _longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherAppURL?lat=$_latitude&lon=$_longitude&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherAppURL?q=$cityName&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url: url);

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
