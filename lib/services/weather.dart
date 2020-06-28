import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '439d4b804bc8187953eb36d2a8c26a02';
const openWeatherMapUrl = 'https://samples.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey';
    NetworkHelper network = new NetworkHelper(url);
    var res = await network.getData();
    return res;
  }

  Future<dynamic> getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    NetworkHelper network = new NetworkHelper('$openWeatherMapUrl?q=uk&lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    var res = await network.getData();
    return res;
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