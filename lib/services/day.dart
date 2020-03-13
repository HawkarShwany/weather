import 'hour.dart';

class Day {

  Day(this.data){
    h1 = Hour(data: data[0]);
    h2 = Hour(data: data[1]);
    h3 = Hour(data: data[2]);
    h4 = Hour(data: data[3]);
    h5 = Hour(data: data[4]);
    h6 = Hour(data: data[5]);
    h7 = Hour(data: data[6]);
    h8 = Hour(data: data[7]);
  }
  List<dynamic> data;
  Hour h1;
  Hour h2;
  Hour h3;
  Hour h4;
  Hour h5;
  Hour h6;
  Hour h7;
  Hour h8;
}