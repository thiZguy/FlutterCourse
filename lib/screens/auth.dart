import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthScreenState();
  }
}

class AuthScreenState extends State<AuthScreen> {
  String _emailVal = '';
  String _passwordVal = '';
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background.jpg'),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop))),
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (String email) {
                        setState(() {
                          _emailVal = email;
                        });
                      },
                    ),
                    SizedBox(
                      height: 5.0
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (String password) {
                        setState(() {
                          _passwordVal = password;
                        });
                      },
                      obscureText: true,
                    ),
                    SwitchListTile(
                      value: _acceptTerms,
                      title: Text('Accept Terms'),
                      onChanged: (bool value) {
                        setState(() {
                          _acceptTerms = value;
                        });
                      }),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      onPressed: () {
                        if (_passwordVal.isNotEmpty && _emailVal.isNotEmpty) {
                          Navigator.pushReplacementNamed(context, '/products');
                        }
                      },
                      child: Text('LOGIN'),
                    )
                  ],
              ),
            ),
          ),
        ));
  }
}
