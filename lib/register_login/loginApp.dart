import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptaxi/register_login/rigister.dart';

class LoginApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginAppState();
  }
}

class LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginApp'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 140.0,
              ),
              Image.asset('images/otovin.jpg'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 6.0),
                child: Text(
                  'Well Come To VinFast',
                  style: TextStyle(fontSize: 22.0, color: Colors.blue),
                ),
              ),
              Text(
                'Login Your Account !',
                style: TextStyle(fontSize: 18.0, color: Colors.blueAccent),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 145.0, 0, 20.0),
                child: TextField(
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Enter Your Email",
                    prefixIcon: Container(
                      width: 50.0,
                      child: Image.asset('images/email.jpg'),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  ),
                  autocorrect: false,
                ),
              ),
              TextField(
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Enter Your Password",
                  prefixIcon: Container(
                    width: 50.0,
                    child: Image.asset('images/pass.jpg'),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                ),
                autocorrect: false,
              ),
              Container(
                constraints: BoxConstraints.loose(Size(double.infinity, 30.0)),
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0.0),
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40.0, 0, 40.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 52.0,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Enter To Login',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 40.0),
                child: RichText(
                  text: TextSpan(
                    text: 'New Account ?',
                    style: TextStyle(fontSize: 16.0, color: Colors.black87),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Rigister()));
                            },
                          text: 'Singin  for new account',
                          style: TextStyle(fontSize: 16.0, color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
