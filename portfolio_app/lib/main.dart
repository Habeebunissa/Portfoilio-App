import 'package:flutter/material.dart';

import 'package:portfolio_app/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home': (context) => MyHome(),
      'about': (context) => About(),
    },
  ));
}
