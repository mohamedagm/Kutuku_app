import 'package:flutter/material.dart';

class SubTitleBoarding extends StatelessWidget {
  const SubTitleBoarding({super.key, required this.sub});
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          sub,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xff707B81),
          ),
        ),
      ),
    );
  }
}
