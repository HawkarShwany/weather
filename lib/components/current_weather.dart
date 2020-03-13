import 'package:flutter/material.dart';
import 'package:weather/services/weather.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    Key key,
    @required this.newWeather,
  }) : super(key: key);

  final Weather newWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // current temp
          Flexible(
            flex: 7,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: FittedBox(
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Icon(
                                Weather.getWeatherIcon(
                                    newWeather.current.condition),
                                size: 40,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  newWeather.current.sky.toString(),
                                  style: TextStyle(
                                      fontSize: 40,
                                      textBaseline: TextBaseline.ideographic),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: FittedBox(
                      child: Text(
                        newWeather.current.temp.toString() + "° C",
                        style: TextStyle(
                          // fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // min and max temp
          Flexible(
            flex: 3,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        newWeather.current.minTemp.toString() + "° C",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: Divider(
                        height: 1,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      child: Text(
                        newWeather.current.maxTemp.toString() + "° C",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
