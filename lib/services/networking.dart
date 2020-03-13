import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Network {
  //constructor
  Network(this.url);
  final String url;
  String directoryPath;
  File forecastFile;
  File weatherFile;
  bool isForecast;
  
  Future getData() async {
    isForecast = url.contains('forecast');
    directoryPath = await _localPath;
    forecastFile = File('$directoryPath/forecast_data.txt');
    weatherFile = File('$directoryPath/weather_data.txt');

    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        if (isForecast) {
          forecastFile.writeAsStringSync(response.body);
        } else {
          weatherFile.writeAsStringSync(response.body);
        }

        return jsonDecode(response.body);
      } else {
        return _body;
      }
    } catch (e) {
      print(e.toString());
      return _body;
    }
  }

  dynamic get _body {
    String body = isForecast ? forecastFile.readAsStringSync() : weatherFile.readAsStringSync();
    return jsonDecode(body);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
