

import 'dart:async';

import 'package:e_commerce_app/ui/cubit/register/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName="SplashScreen";

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 9), () {
      Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
    });
    return Image.asset('assets/images/splashScreen.png',width:double.infinity ,height: double.infinity,
    fit: BoxFit.fill,);

  }
}
