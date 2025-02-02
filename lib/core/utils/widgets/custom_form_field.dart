import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final FormFieldValidator? validator;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final bool isObscure;
  final bool isActive;
  final ValueChanged<String>? onChanged;
  const CustomFormField(
      {super.key,
      this.hint,
      required this.label,
      required this.textInputType,
      required this.textEditingController,
      this.isObscure = false,
      this.validator,
      this.isActive = true,
      this.onChanged});

  const CustomFormField.auth(
      {super.key,
      required this.hint,
      required this.label,
      required this.textInputType,
      required this.textEditingController,
      this.isObscure = false,
      required this.validator,
      this.isActive = true,
      this.onChanged});

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
            hintText: hint ?? '',
            border: const OutlineInputBorder()),
        onChanged: onChanged);
  }
}
