import 'package:flutter/services.dart';
import 'package:weather/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    Weather weather = Weather();
    await weather.getLocationWeather();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainScreen(weather: weather,)), (route) => false);
    
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            getLocationData();
          },
          child: SpinKitDoubleBounce(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
