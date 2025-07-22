import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kutuku/core/errors/failures.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.dio) : super(LoginInitial());
  final Dio dio;
  Future<void> login({required String name, required String password}) async {
    emit(LoginLoading());

    try {
      final res = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {"username": name, "password": password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (res.statusCode == 200) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure('Unexpected status code: ${res.statusCode}'));
      }
    } on DioException catch (e) {
      emit(LoginFailure(DioExceptions.fromDioError(e).errMessage));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
