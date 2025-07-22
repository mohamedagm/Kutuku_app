import 'package:flutter/material.dart';
import 'package:kutuku/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:kutuku/features/home/presentation/widgets/custom_bottom_app_bar.dart';
import 'package:kutuku/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: HomeViewBody(),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
