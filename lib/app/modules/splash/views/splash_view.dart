import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:habitstrackingcultureofficeapp/app/modules/onbording/views/onbording_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final Color primaryGreen = const Color(0xFF38C172);

  @override
  void initState() {
    super.initState();
    _setSystemUIOverlay();
    _navigateToNextScreen();
  }

  void _setSystemUIOverlay() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: primaryGreen, 
        statusBarIconBrightness:
            Brightness.light, 
        systemNavigationBarColor:
            primaryGreen, 
        systemNavigationBarIconBrightness: Brightness
            .light, 
      ),
    );
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnbordingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: primaryGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo/logo_2.png', 
              width: 90,
              height: 90,
            ),

            const SizedBox(height: 30),
            const Text(
              'Habits Tracking',
              textAlign: TextAlign.center,
              style: textStyle,
            ),

            const Text(
              'Culture Office',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
