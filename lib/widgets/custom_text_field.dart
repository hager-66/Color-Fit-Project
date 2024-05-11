import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key, this.hintText, this.onChanged, this.obscureText = false});
  Function(String)? onChanged;
  String? hintText;

  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
