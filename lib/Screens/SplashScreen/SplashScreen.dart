import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../OnbordingScreen/OnboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ایجاد یک تأخیر قبل از هدایت به صفحه اصلی
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'صفحه شروع',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}

