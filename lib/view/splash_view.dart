import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled6/view/home/home_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'inital';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(HomeView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ],
    );
  }
}
