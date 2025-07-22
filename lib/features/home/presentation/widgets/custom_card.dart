import 'package:flutter/material.dart';
import 'package:kutuku/core/utils/styles.dart';
import 'package:kutuku/features/home/data/models/product_model/product_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   UpdateProductScreen.id,
        //   arguments: productModel,
        // );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  spreadRadius: -10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      productModel.title!,
                      //  productModel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.kHomeShoesName,
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${productModel.price!}',
                          style: Styles.kHomeShoesPrice,
                        ),
                        //  Text('\$${productModel.price.toString()}'),
                        Container(
                          height: 28,
                          width: 28,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              // add to cart
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: -35,
            left: 60,
            child: Image.network(
              height: 120,
              width: 120,
              productModel.images![1],
            ),
          ),
        ],
      ),
    );
  }
}
