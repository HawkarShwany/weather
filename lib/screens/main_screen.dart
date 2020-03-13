import 'package:flutter/material.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/components/detailCard.dart';
import 'search_screen.dart';
import 'package:weather/components/current_weather.dart';
import 'package:weather/components/forecast.dart';

class MainScreen extends StatefulWidget {
  MainScreen({this.weather});
  final Weather weather;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Weather newWeather;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newWeather = widget.weather;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Tooltip(
          message: "Weather at your location",
          child: FlatButton(
            child: Icon(Icons.near_me),
            onPressed: () async {
              await newWeather.getLocationWeather();

              setState(() {});
            },
          ),
        ),
        title: Text(widget.weather.city),
        actions: <Widget>[
          Tooltip(
            message: "Search for a city",
            child: FlatButton(
              child: Icon(Icons.search),
              onPressed: () async {
                var city = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
                if (city != null) {
                  await newWeather.getCityWeather(city.toString());
                } else {
                  await newWeather.getLocationWeather();
                }

                setState(() {});
              },
            ),
          ),
          // SizedBox(
          //   width: 20,
          // ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(newWeather.country),
              ),
              // current time
              Center(
                child: Text((newWeather.current.date.hour - 12).toString() +
                    ":" +
                    DateTime.now().minute.toString()),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: CurrentWeather(newWeather: newWeather),
                ),
              ),
              // next 24 hour
              Divide(title: "Hourly"),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Forecast(newWeather.day1),
                ),
              ),
              Divide(title: "Details"),
              Expanded(
                flex: 4,
                child: FittedBox(
                  child: Row(
                    children: <Widget>[
                      DetailCard(
                        "Feels Like",
                        newWeather.current.feelsLike.toString() + "° C",
                      ),
                      DetailCard(
                        "Wind",
                        newWeather.current.windSpeed.toString() + " m/s",
                      ),
                      DetailCard(
                        "Humidity",
                        newWeather.current.humidity.toString() + " %",
                      ),
                      DetailCard(
                        "Visibility",
                        newWeather.current.visibility,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Divide extends StatelessWidget {
  const Divide({Key key, @required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Row(
        // textBaseline: TextBaseline.alphabetic,
        // crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title + " ",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: Divider(
              height: 1,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
