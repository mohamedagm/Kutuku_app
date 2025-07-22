import 'package:flutter/material.dart';
import 'package:kutuku/features/login/presentation/widgets/custom_text_field.dart';
import 'package:kutuku/features/login/presentation/widgets/styles.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool visible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F9FA),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Hello Again !', style: Styles.kLoginTitle),
                  Text(
                    'Welcome Back You’ve Been Missed!',
                    style: Styles.kLoginSubtitle,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    hintText: 'Email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    picon: Icons.email,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'Paswword',
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      } else if (value.length <= 6) {
                        return 'دي باسورد ترضي ربنا ؟';
                      }
                      return null;
                    },
                    picon: Icons.password,
                    visible: visible,
                    sicon: IconButton(
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                          // visible ? visible = false : visible = true;
                        });
                      },
                      icon:
                          visible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Recovery password',
                        style: Styles.kForgotPassword,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5B9EE1),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width - 30,
                        60,
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'جدع يا حماده تم اصطياد الاكونت الخااص بك\n'
                              'email: ${emailController.text}\n'
                              'pass: ${passwordController.text}',
                            ),
                          ),
                        );
                        emailController.clear();
                        passwordController.clear();
                      }
                    },
                    child: Text('Sign In', style: Styles.kButtonText),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width - 30,
                        60,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 32,
                          child: Image.asset('assets/images/google.png'),
                        ),
                        SizedBox(width: 5),
                        Text('Sign in with Google', style: Styles.kSignUpLink),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: Styles.kSignUpHint),
                      TextButton(
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => RegisterView(),
                          //   ),
                          // );
                        },
                        child: Text(
                          'Sign Up For Free',
                          style: Styles.kSignUpLink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
