import 'package:flutter/material.dart';
import 'package:notes_app/Main%20Files/onboardingScreen.dart';
import 'package:notes_app/apps/notes/pages/notes_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigationethome();
  }

  _navigationethome() async {
    await Future.delayed(Duration(milliseconds: 1800), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/file/default.png",
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
