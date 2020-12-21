import 'package:flutter/material.dart';
import 'package:mtg_manadome/screens/authenticate_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthenticateWrapper(),
    );
  }
}
