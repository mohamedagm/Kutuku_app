import 'package:flutter/material.dart';
import 'package:kutuku/features/login/presentation/widgets/custom_button.dart';
import 'package:kutuku/features/login/presentation/widgets/custom_text_field.dart';
import 'package:kutuku/core/utils/styles.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
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
    return Padding(
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
                CustomButton(
                  backgroundColor: Color(0xff5B9EE1),
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
                CustomButton(
                  backgroundColor: Colors.white,
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
    );
  }
}
