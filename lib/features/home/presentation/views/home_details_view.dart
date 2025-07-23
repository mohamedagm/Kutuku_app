import 'package:flutter/material.dart';
import 'package:kutuku/core/utils/styles.dart';
import 'package:kutuku/features/home/data/models/product_model/product_model.dart';
import 'package:kutuku/features/home/presentation/widgets/home_details_view_body.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.kBackGroundColor,
      body: HomeDetailsViewBody(productModel: productModel),
    );
  }
}
