import 'package:flutter/cupertino.dart';

Widget textStyling(String text, double fontSize,Color color,FontWeight weight){
  return Padding(
    padding: const EdgeInsets.only(top:15,left: 20,bottom: 10),
    child: Text(
      text,
      style: TextStyle(fontSize: fontSize,color: color,fontWeight: weight),
    ),
  );
}