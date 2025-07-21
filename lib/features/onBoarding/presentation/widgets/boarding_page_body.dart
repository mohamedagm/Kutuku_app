import 'package:flutter/material.dart';
import 'package:kutuku/features/onBoarding/data/boarding_model.dart';
import 'package:kutuku/features/onBoarding/presentation/widgets/ellipse_shape.dart';
import 'package:kutuku/features/onBoarding/presentation/widgets/shoes_Boarding.dart';
import 'package:kutuku/features/onBoarding/presentation/widgets/sub_title_boarding.dart';
import 'package:kutuku/features/onBoarding/presentation/widgets/title_boarding.dart';

class BoardingPageBody extends StatelessWidget {
  const BoardingPageBody({
    super.key,
    required this.pageController,
    required this.boardingModel,
  });
  final PageController pageController;
  final BoardingModel boardingModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EllipseShape(),
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            ShoesBoarding(imageLink: boardingModel.imageLink),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            TitleBoarding(title: boardingModel.title),
            SizedBox(height: 10),
            SubTitleBoarding(sub: boardingModel.sub),
          ],
        ),
      ],
    );
  }
}
