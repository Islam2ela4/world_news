import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_news/screens/news_screen.dart';

class Splash extends StatefulWidget {
  static final ROUTE = '/';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => NewsScreen(),
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'World ',
              style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'PoppinsExBold'),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue, fontSize: 50, fontFamily: 'PoppinsExBold'),
            ),
          ],
        ),
      ),
    );
  }
}
