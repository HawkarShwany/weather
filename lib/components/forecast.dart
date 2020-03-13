import 'package:flutter/material.dart';
import 'package:weather/services/day.dart';
import 'package:weather/components/customCard.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/services/hour.dart';
import 'package:weather/constants.dart';

class Forecast extends StatelessWidget {
  Forecast(this.day);
  final Day day;
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        card(day.h1),
        card(day.h2),
        card(day.h3),
        card(day.h4),
        card(day.h5),
        card(day.h6),
        card(day.h7),
        card(day.h8),
      ],
    );
  }

  Widget card(Hour hour) {
    String time;
    if (hour.date.hour == 12) {
      time = hour.date.hour.toString() + " PM";
    } else if (hour.date.hour > 12) {
      time = (hour.date.hour - 12).toString() + " PM";
    } else {
      time = hour.date.hour.toString() + " AM";
    }
    return CustomCard(
      cardChild: Column(
        children: <Widget>[
          Text(
            time,
            style: kDaysTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Icon(
            Weather.getWeatherIcon(hour.condition),
            color: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Text(hour.humidity.toString() + "%"),
          SizedBox(
            height: 10,
          ),
          Text(
            hour.temp.toString() + "°",
          ),
        ],
      ),
    );
  }
}
