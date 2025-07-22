import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kutuku/core/errors/failures.dart';
import 'package:kutuku/features/home/data/models/product_model/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.dio) : super(ProductsInitial());
  final Dio dio;
  getProducts() async {
    emit(ProductsLoading());
    try {
      List<ProductModel> productList = [];
      var result = await dio.get(
        'https://dummyjson.com/products/category/mens-shoes',
      );
      for (var product in result.data['products']) {
        productList.add(ProductModel.fromJson(product));
      }
      emit(ProductsSuccess(productList));
    } on DioException catch (e) {
      emit(ProductsFailure(DioProductsExceptions.fromDioError(e).errMessage));
    } catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }
}
