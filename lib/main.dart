import 'package:flutter/material.dart';

void main() {
  runApp(const KutukuApp());
}

class KutukuApp extends StatelessWidget {
  const KutukuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Kutuku_App'),
        ),
      ),
    );
  }
}
