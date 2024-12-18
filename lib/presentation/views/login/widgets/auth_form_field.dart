import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final String label;
  final String hint;
  final FormFieldValidator validator;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final bool isObscure;
  final bool isActive;
  const AuthFormField(
      {super.key,
      required this.hint,
      required this.label,
      required this.textInputType,
      required this.textEditingController,
      this.isObscure = false,
      required this.validator,
      this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isObscure,
      validator: validator,
      enabled: isActive,
      decoration: InputDecoration(
          label: Text(label),
          hintText: hint,
          border: const OutlineInputBorder()),
    );
  }
}
