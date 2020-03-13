class Hour {
  Hour({this.data}) {
    sky = data['weather'][0]['main'];
    condition = data['weather'][0]['id'];
    temp = data['main']['temp'].round();
    feelsLike = data['main']['feels_like'].round();
    minTemp = data['main']['temp_min'].round();
    maxTemp = data['main']['temp_max'].round();
    date = data['dt_txt'] != null ?  DateTime.parse(data['dt_txt']) : DateTime.now() ;
    windSpeed = data['wind']['speed'].toString();
    humidity = data['main']['humidity'].round();
    visibility = data['visibility'] != null ? (data['visibility'] / 1000).round().toString() +" Km" : "N/A";
  }
  var data;
  var sky;
  var weatherIcon;
  var condition;
  int feelsLike;
  int temp;
  int minTemp;
  int maxTemp;
  var date;
  String windSpeed;
  int humidity;
  String visibility = "N/A";
}
