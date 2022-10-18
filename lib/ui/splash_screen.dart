import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), (){
      Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 200,
            width: 400,
            child: Image.asset(
              'assets/star-wars.png',
            ),
          ),
          const Text(
            'Powered by https://swapi.dev/',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
