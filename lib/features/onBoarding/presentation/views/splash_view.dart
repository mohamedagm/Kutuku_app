import 'package:flutter/material.dart';
import 'package:kutuku/features/onBoarding/presentation/views/on_boarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff514EB7),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),

              Text(
                'Kutuku',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Any shopping just from home',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.5),
              Text('Version 0.0.1', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToBoarding() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnBoardingView()),
      );
    });
  }
}
