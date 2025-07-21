import 'package:flutter/material.dart';

class EllipseShape extends StatelessWidget {
  const EllipseShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 194,
      top: -182,
      child: Stack(
        children: [
          Container(
            width: 389,
            height: 389,
            decoration: BoxDecoration(
              color: Color(0xffC0E0FF),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            left: 100,
            top: 100,
            child: Container(
              width: 389 / 2,
              height: 389 / 2,
              decoration: BoxDecoration(
                color: Color(0xffE2F3F9),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
