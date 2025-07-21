import 'package:flutter/material.dart';
import 'package:kutuku/features/onBoarding/presentation/views/splash_view.dart';

void main() {
  runApp(const KutukuApp());
}

class KutukuApp extends StatelessWidget {
  const KutukuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cereal'),
      home: SplashView(),
    );
  }
}
