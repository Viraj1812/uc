import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final Function()? onFieldSubmitted;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.focusNode,
    this.validator,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      focusNode: focusNode,
      validator: validator,
      onFieldSubmitted: (_) => onFieldSubmitted?.call(),
    );
  }
}
