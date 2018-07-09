import 'package:flutter/material.dart';
import '../products.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AuthPageState();
  }
}

class AuthPageState extends State<AuthPage> {
  String _email;
  String _password;
  bool _acceptTerms = false;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
      fit: BoxFit.cover,
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Email', filled: true, fillColor: Colors.white),
      onChanged: (String value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      onChanged: (String value) {
        setState(() {
          _password = value;
        });
      },
      obscureText: true,
    );
  }

  Widget _buildAcceptTermsAndCondition() {
    return SwitchListTile(
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
      title: Text('Accpet Terms And Conditions'),
    );
  }

  void _submitForm() {
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 500.0 ? 500.0 : deviceWidth * 0.95;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Please Authenticate'),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: _buildBackgroundImage(),
            ),
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: targetWidth,
                  child: Column(
                    children: <Widget>[
                      _buildEmailTextField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildPasswordTextField(),
                      _buildAcceptTermsAndCondition(),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        child: Text('Login'),
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                        onPressed: _submitForm,
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
