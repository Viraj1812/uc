import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String value;
  final ValueChanged<String?>? onChanged;
  final String? Function(String?)? validator;
  final List<String> items;
  final String labelText;

  const CustomDropdownFormField({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.validator,
    required this.items,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      onChanged: onChanged,
      validator: validator,
      items: items.map((type) {
        return DropdownMenuItem(
          value: type,
          child: Text(type),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
