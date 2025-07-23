import 'package:flutter/material.dart';
import 'package:kutuku/core/utils/styles.dart';
import 'package:kutuku/features/home/data/models/product_model/product_model.dart';
import 'package:kutuku/features/home/presentation/widgets/custom_details_info_style.dart';

class HomeDetailsViewBottomSection extends StatefulWidget {
  const HomeDetailsViewBottomSection({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<HomeDetailsViewBottomSection> createState() =>
      _HomeDetailsViewBottomSectionState();
}

class _HomeDetailsViewBottomSectionState
    extends State<HomeDetailsViewBottomSection> {
  int imgIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title,price,desc
              Text(widget.productModel.title!, style: Styles.kDetailsTitle),
              Text(
                '\$${widget.productModel.price}',
                style: Styles.kDetailsShoesPrice,
              ),
              Text(
                widget.productModel.description!,
                style: Styles.kDetailsDesc,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),

              //stock,warranty,ships
              Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDetailsInfoContainer(
                        widthRatio: 0.4,
                        child: Text(
                          '${widget.productModel.availabilityStatus} '
                          '${widget.productModel.stock}',
                          style: Styles.kDetailsShoesInfo,
                        ),
                      ),
                      CustomDetailsInfoContainer(
                        widthRatio: 0.4,
                        child: Text(
                          widget.productModel.warrantyInformation.toString(),
                          style: Styles.kDetailsShoesInfo,
                        ),
                      ),
                    ],
                  ),
                  CustomDetailsInfoContainer(
                    widthRatio: 0.7,
                    child: Text(
                      '${widget.productModel.shippingInformation}',
                      style: Styles.kDetailsShoesInfo,
                    ),
                  ),
                ],
              ),

              //size,type
              Center(
                child: Text(
                  'size '
                  ' ${widget.productModel.tags.toString()}',
                  style: Styles.kDetailsShoesPrice,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  6,
                  (index) => GestureDetector(
                    onTap:
                        () => setState(() {
                          imgIndex = index;
                        }),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow:
                            index == imgIndex
                                ? [
                                  BoxShadow(
                                    offset: Offset(0, 2),
                                    blurStyle: BlurStyle.normal,
                                    color: Colors.blueAccent,
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                  ),
                                ]
                                : [],
                        color:
                            index == imgIndex
                                ? Styles.kPrimaryColor
                                : Styles.kBackGroundColor,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 38}',
                          style: TextStyle(
                            color:
                                index == imgIndex
                                    ? Styles.kBackGroundColor
                                    : Color(0xff707B81),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //price,button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('price'),
                      Text(
                        '\$${widget.productModel.price}',
                        style: Styles.kDetailsShoesPrice,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Styles.kPrimaryColor,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.4,
                        50,
                      ),
                    ),
                    child: Text('Add To Cart', style: Styles.kButtonText),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
