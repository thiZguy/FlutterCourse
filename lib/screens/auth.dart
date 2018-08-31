import './products.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthScreenState();
  }
}

class AuthScreenState extends State<AuthScreen> {
  String emailVal = '';
  String passwordVal = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Center(
              child: ListView(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: (String email) {
                  setState(() {
                    emailVal = email;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                onChanged: (String password) {
                  setState(() {
                    passwordVal = password;
                  });
                },
                obscureText: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: () {
                  if (passwordVal.isNotEmpty && emailVal.isNotEmpty) {
                    Navigator.pushReplacementNamed(context, '/products');
                  }
                },
                child: Text('LOGIN'),
              )
            ],
          )),
        ));
  }
}
