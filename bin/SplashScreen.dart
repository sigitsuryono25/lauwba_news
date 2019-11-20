import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainMenu.dart';

void main() => runApp(SplashScreen());

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: _SplashScreenHome(),
    );
  }
}

class _SplashScreenHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<_SplashScreenHome> {
  @override
  Widget build(BuildContext context) {
    _setTimer(context);
    return Container(
      color: Colors.white,
      child: Center(
        child: Image(
          image: AssetImage("graphics/logo_lauwba_techno_indonesia.png"),
        ),
      ),
    );
  }

  void _setTimer(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainMenu()),
            (Route route) => false);
      });
    });
  }
}
