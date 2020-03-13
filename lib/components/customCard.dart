import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({ this.cardChild});
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
          child: Container(
        child: cardChild,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration:
            BoxDecoration(
              color: Color(0x33ffffff), 
              borderRadius: BorderRadius.circular(5)
              ),
      ),
    );
  }
}
