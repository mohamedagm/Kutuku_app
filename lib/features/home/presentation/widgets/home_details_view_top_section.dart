import 'package:flutter/material.dart';
import 'package:kutuku/core/utils/styles.dart';
import 'package:kutuku/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:kutuku/features/home/presentation/widgets/home_details_view_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeDetailsViewTopSection extends StatelessWidget {
  const HomeDetailsViewTopSection({
    super.key,
    required this.pageController,
    required this.widget,
  });

  final PageController pageController;
  final HomeDetailsViewBody widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          //details app bar
          CustomAppBar(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.pop(context),
            title: Text(
              'Men’s Shoes',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          //pageview
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.8,
            child: PageView(
              controller: pageController,
              children: List.generate(
                4,
                (index) => Image.network(widget.productModel.images![index]),
              ),
            ),
          ),

          //indicator
          SmoothPageIndicator(
            controller: pageController,
            count: 4,
            effect: WormEffect(
              activeDotColor: Styles.kPrimaryColor,
              dotWidth: 18,
              dotHeight: 8,
              dotColor: Colors.grey[400]!,
            ),
          ),
        ],
      ),
    );
  }
}
