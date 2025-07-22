import 'package:flutter/material.dart';
import 'package:kutuku/core/utils/styles.dart';
import 'package:kutuku/features/login/presentation/views/login_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomBoarding extends StatelessWidget {
  const BottomBoarding({
    super.key,
    required this.pageController,
    required this.currentPage,
  });

  final PageController pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: WormEffect(
              dotHeight: 5,
              dotWidth: 25,
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                MediaQuery.of(context).size.width * 0.4,
                MediaQuery.of(context).size.height * 0.06,
              ),
              backgroundColor: Styles.kPrimaryColor,
            ),
            onPressed: () {
              currentPage == 2
                  ? Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginView()),
                  )
                  : pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
            },
            child: Text(
              currentPage == 0 ? 'Get Started' : 'Next',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
