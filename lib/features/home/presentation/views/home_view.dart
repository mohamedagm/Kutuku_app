import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutuku/core/utils/styles.dart';
import 'package:kutuku/features/home/presentation/manager/productsCubit/products_cubit.dart';
import 'package:kutuku/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:kutuku/features/home/presentation/widgets/custom_bottom_app_bar.dart';
import 'package:kutuku/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.kBackGroundColor,
      appBar: CustomAppBar(
        icon: Icon(Icons.apps),
        title: Column(
          children: [
            Text(
              'Store location',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '📍Egypt, naser city',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => ProductsCubit(Dio()),
        child: HomeViewBody(),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
