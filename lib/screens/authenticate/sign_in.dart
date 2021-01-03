import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtg_manadome/screens/authenticate/register.dart';
import 'package:mtg_manadome/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // temporary text filed state management
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(25.0, 70.0, 25.0, 0.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Image.asset("assets/iconwhite.png"),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      validator: (val) => val.length < 6
                          ? 'Enter a password longer than 6 chars'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      }),
                  SizedBox(height: 20.0),
                ])),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                color: Colors.white24,
                child: Text('Sign in'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() =>
                          error = 'could not sign in with those credentials');
                    }
                  }
                },
              ),
              RaisedButton(
                color: Colors.white24,
                child: Text('Register'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() => error = 'please supply a valid email');
                    }
                  }
                },
              ),
            ],
          ),
          Text('Add Forgot Password button :)'),
          Text(
            error,
            style: TextStyle(color: Colors.red),
          )
        ]),
      )),
    );
  }
}
