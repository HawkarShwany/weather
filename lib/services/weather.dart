import 'package:flutter/material.dart';
import 'package:weather/constants.dart';
import 'package:weather_icons/weather_icons.dart';
import 'networking.dart';
import 'location.dart';
import 'day.dart';
import 'hour.dart';

class Weather {
  
  Hour current;
  Day day1;
  Day day2;
  Day day3;
  Day day4;
  Day day5;
  String city;
  String country;

  void assignDays(var data, var data2) async{
    current = Hour(data: data2);
    city = data2['name'];
    country = data2['sys']['country'];
    day1 = Day([
      data['list'][0],
      data['list'][1],
      data['list'][2],
      data['list'][3],
      data['list'][4],
      data['list'][5],
      data['list'][6],
      data['list'][7],
    ]);
    // day2 = Day([
    //   data['list'][8],
    //   data['list'][9],
    //   data['list'][10],
    //   data['list'][11],
    //   data['list'][12],
    //   data['list'][13],
    //   data['list'][14],
    //   data['list'][15],
    // ]);
    // day3 = Day([
    //   data['list'][16],
    //   data['list'][17],
    //   data['list'][18],
    //   data['list'][19],
    //   data['list'][20],
    //   data['list'][21],
    //   data['list'][22],
    //   data['list'][23],
    // ]);
    // day4 = Day([
    //   data['list'][24],
    //   data['list'][25],
    //   data['list'][26],
    //   data['list'][27],
    //   data['list'][28],
    //   data['list'][29],
    //   data['list'][30],
    //   data['list'][31],
    // ]);
    // day5 = Day([
    //   data['list'][32],
    //   data['list'][33],
    //   data['list'][34],
    //   data['list'][35],
    //   data['list'][36],
    //   data['list'][37],
    //   data['list'][38],
    //   data['list'][39],
    // ]);
  }

  Future getCityWeather(String city) async {
    var url = kForecast + "q=" + city + "&appid=" + kApiKey + "&units=metric";
    Network network = Network(url);
    var data = await network.getData();
    Future.delayed(Duration(minutes: 1)); // sleep for 1 sec
    url = kWeather + "q=" + city + "&appid=" + kApiKey + "&units=metric";
    Network network2 = Network(url);
    var data2 = await network2.getData();

    assignDays(data, data2);
    // print( data2);
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var url = kForecast +
        "lat=" +
        location.latitude.toString() +
        "&lon=" +
        location.longitude.toString() +
        "&appid=" +
        kApiKey +
        "&units=metric";

    Network network = Network(url); // forecast
    var data = await network.getData();
    
    Future.delayed(Duration(minutes: 1)); // sleep for 1 sec
    url = kWeather +
        "lat=" +
        location.latitude.toString() +
        "&lon=" +
        location.longitude.toString() +
        "&appid=" +
        kApiKey +
        "&units=metric";
    Network network2 = Network(url); // current
    // print(url);
    var data2 = await network2.getData();

    // print("data: "+data2.toString());
    await assignDays(data, data2);
  }

  static IconData getWeatherIcon(int condition) {
    if (condition < 300) {
      return WeatherIcons.thunderstorm;
      // return "🌩";
    } else if (condition < 400) {
      return WeatherIcons.rain_mix;
      // return "🌧";
    } else if (condition < 600) {
      return WeatherIcons.rain;
      // return "☔️";
    } else if (condition < 700) {
      return WeatherIcons.snow;
      // return "☃️";
    } else if (condition <= 800) {
      return WeatherIcons.day_sunny;
      // return "☀️";
    } else if (condition <= 804) {
      return WeatherIcons.day_cloudy;
      // return "☁️";
    } else {
      // return "🤷‍";
      return WeatherIcons.alien;
    }
  }
}
