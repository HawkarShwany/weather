import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
    String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('images/city_background.jpg'),
            //   fit: BoxFit.cover,
            // ),
            ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                   
                  onChanged: (value) {
                    cityName = value;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    hintText: 'Enter city name',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    color: Colors.white,
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