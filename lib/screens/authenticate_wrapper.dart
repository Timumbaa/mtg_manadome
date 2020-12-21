import 'package:flutter/material.dart';
import 'package:mtg_manadome/screens/authenticate/authenticate.dart';
import 'package:mtg_manadome/screens/home/home.dart';

class AuthenticateWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return either home or authenticate widget
    return Home();
  }
}
