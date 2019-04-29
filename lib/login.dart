import 'package:flutter/material.dart';
import 'package:pinstagram/color.dart';
import 'package:pinstagram/homepage.dart';
import 'package:pinstagram/strings.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _onsignin() {
    Navigator.pushReplacement(
        context, new CupertinoPageRoute(builder: (_) => new HomePage()));
  }

  _signinbutton(height, width) {
    return new Container(
      margin: EdgeInsets.only(top: 30),
      child: new Container(
        width: width / 2,
        height: height / 11,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              child: new Text(
                signup,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15.0),
              ),
            ),
            new Container(
              margin: EdgeInsets.all(5.0),
              constraints: BoxConstraints.expand(height: 100, width: 50),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: arrowbuttonblue),
              child: new IconButton(
                onPressed: _onsignin,
                icon: Icon(Icons.arrow_forward),
                color: darkblue,
              ),
            )
          ],
        ),
        decoration: new BoxDecoration(
            color: signupbuttonblue, borderRadius: BorderRadius.circular(50.0)),
      ),
    );
  }

  _logotext(height, width) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(top: height / 8),
          child: new Text(appname,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: darkblue, fontFamily: "Amsterdam", fontSize: 40)),
        ),
        new Container(
          child: new Text(detailtext,
              textAlign: TextAlign.center,
              style: TextStyle(color: lightblue, fontSize: 12)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            height: height,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: new Image.asset(
                "assets/back.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          new Column(
            children: <Widget>[
              _logotext(height, width),
              _signinbutton(height, width)
            ],
          ),
        ],
      ),
    );
  }
}
