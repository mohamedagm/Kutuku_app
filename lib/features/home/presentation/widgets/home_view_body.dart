import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutuku/features/home/data/models/product_model/product_model.dart';
import 'package:kutuku/features/home/presentation/manager/productsCubit/products_cubit.dart';
import 'package:kutuku/features/home/presentation/widgets/custom_card.dart';
import 'package:kutuku/features/login/presentation/widgets/custom_text_field.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  TextEditingController? controller;
  ProductModel productModel = ProductModel();
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Looking for shoes',
                  controller: controller,
                  validator: (value) {
                    return null;
                  },
                  picon: Icons.search,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) {
                    bool exp = index == 0 ? true : false;
                    return GestureDetector(
                      onTap: () {
                        // choose shoes Category
                      },
                      child: Column(
                        children: [
                          Container(
                            width: exp ? 70 : 55,
                            height: exp ? 35 : 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(16),
                                right: Radius.circular(16),
                              ),
                              color: exp ? Colors.blueAccent : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Nike',
                                style: TextStyle(
                                  color: exp ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: SizedBox(
                    child: GridView.builder(
                      //clipBehavior: Clip.none,//bad in this situation
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        mainAxisSpacing: 35,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: CustomCard(
                            productModel: state.productList[index],
                          ),
                        );
                      },
                      itemCount: state.productList.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProductsFailure) {
          return Center(
            child: Text(
              state.errMsg,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
