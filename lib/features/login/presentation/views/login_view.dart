import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutuku/core/utils/styles.dart';
import 'package:kutuku/features/login/presentation/manager/loginCubit/login_cubit.dart';
import 'package:kutuku/features/login/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.kBackGroundColor,
      body: BlocProvider(
        create: (context) => LoginCubit(Dio()),
        child: const LoginViewBody(),
      ),
    );
  }
}
