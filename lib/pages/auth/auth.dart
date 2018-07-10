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
  final GlobalKey<FormState> _GpKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
      fit: BoxFit.cover,
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
          return "Please enter valid email";
        }
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "Password is required";
        }
      },
      onSaved: (String value) {
        _password = value;
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
    if (!_GpKey.currentState.validate()) {
      return;
    }
    _GpKey.currentState.save();
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
            child: Form(
              key: _GpKey,
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
                          textColor: Colors.white,
                          onPressed: _submitForm,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
