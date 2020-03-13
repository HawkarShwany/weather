import 'package:flutter/material.dart';
import 'customCard.dart';
import 'package:weather_icons/weather_icons.dart';

class DetailCard extends StatelessWidget {
  DetailCard(this.title, this.data);
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      cardChild: Column(
        children: <Widget>[
          Icon(
            getIcon(),
            color: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Text(title),
          SizedBox(
            height: 20,
          ),
          Text(data),
        ],
      ),
    );
  }

  IconData getIcon() {
    switch (title) {
      case "Feels Like":
        return WeatherIcons.thermometer;
        break;
      case "Wind":
        return WeatherIcons.strong_wind;
        break;
      case "Humidity":
        return WeatherIcons.humidity;
        break;
      case "Visibility":
        return Icons.remove_red_eye;
      default:
      return null;
    }
  }
}
