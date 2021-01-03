import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mtg_manadome/models/app_user.dart';
import 'package:mtg_manadome/screens/authenticate_wrapper.dart';
import 'package:mtg_manadome/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: Colors.blue,
            fontFamily: 'Beleren',
            scaffoldBackgroundColor: Colors.transparent,
            primarySwatch: Colors.blueGrey,
            cursorColor: Colors.grey,
            inputDecorationTheme: InputDecorationTheme(
              errorStyle: TextStyle(height: 0),
              border: InputBorder.none,
            )),
        home: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF333333),
                    Colors.blueGrey,
                  ],
                  stops: [0.3, 1],
                )),
                child: AuthenticateWrapper())),
      ),
    );
  }
}
