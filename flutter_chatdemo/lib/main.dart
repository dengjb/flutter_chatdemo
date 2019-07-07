import 'package:flutter/material.dart';
import 'home_page.dart';

void main(){
  runApp(new MaterialApp(
    theme:ThemeData(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Color(0xffebebeb),
      cardColor: Colors.green,
      //backgroundColor: Colors.black,
    ),
    home: HomePage(),
  ));
}

