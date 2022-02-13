import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptaxi/blocks/auth_blocks.dart';
import 'package:flutter_apptaxi/register_login/home_page.dart';
import 'package:flutter_apptaxi/register_login/loginApp.dart';

class Rigister extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RigisterState();
  }
}

class RigisterState extends State<Rigister> {
  AuthBloc authBloc = new AuthBloc();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    authBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Image.asset('images/otovin.jpg'),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40.0, 0, 6.0),
                child: Text(
                  'Wellcome To VinFast',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                ),
              ),
              Text(
                'Singin with Your Account',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 80.0, 0, 20.0),
                child: StreamBuilder(
                  stream: authBloc.nameStream,
                  builder: (context, snapshot) => TextField(
                    controller: _nameController,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                    decoration: InputDecoration(
                      // errorText: snapshot.hasError ? snapshot.error : null,
                      labelText: 'Name',
                      prefixIcon: Container(
                        width: 50.0,
                        child: Image.asset('images/user.jpg'),
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          )),
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                stream: authBloc.emailStream,
                builder: (context, snapShot) => TextField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Container(
                      width: 50.0,
                      child: Image.asset('images/phone.jpg'),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                child: StreamBuilder(
                  stream: authBloc.phoneStream,
                  builder: (context, snapShot) => TextField(
                    controller: _phoneController,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Container(
                        width: 50.0,
                        child: Image.asset('images/email.jpg'),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                stream: authBloc.passStream,
                builder: (context, snapshot) => TextField(
                  controller: _passController,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Container(
                      width: 50.0,
                      child: Image.asset('images/pass.jpg'),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30.0, 0, 40.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 52.0,
                  child: RaisedButton(
                    onPressed: _SingUpClick,
                    child: Text(
                      'Singup',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 40.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Already A Acount ?',
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginApp(),
                                  ));
                            },
                          text: 'Login Now',
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

  _SingUpClick() {
    var isValid = authBloc.isValid(_nameController.text, _emailController.text,
        _phoneController.text, _passController.text);
    if (isValid) {
      authBloc.sigUp(_nameController.text, _emailController.text,
          _phoneController.text, _passController.text, () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
  }
}
