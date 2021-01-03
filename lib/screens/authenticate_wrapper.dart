import 'package:flutter/material.dart';
import 'package:mtg_manadome/models/app_user.dart';
import 'package:mtg_manadome/screens/authenticate/authenticate.dart';
import 'package:mtg_manadome/screens/home/home.dart';
import 'package:provider/provider.dart';

class AuthenticateWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);

    // return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
