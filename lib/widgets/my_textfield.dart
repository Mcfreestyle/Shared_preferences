import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const MyTextField(
      {super.key,
      this.keyboardType,
      this.hintText,
      this.prefixIcon,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.green),
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
