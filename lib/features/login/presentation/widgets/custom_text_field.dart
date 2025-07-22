import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.picon,
    this.sicon,
    this.visible,
    this.hintText,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData picon;
  final IconButton? sicon;
  final bool? visible;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: visible ?? false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        prefixIcon: Icon(picon),
        suffixIcon: sicon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Color(0xffF8F9FA)),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      ),
    );
  }
}
