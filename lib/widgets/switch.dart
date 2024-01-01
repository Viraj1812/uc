import 'package:flutter/material.dart';

class SwitchWid extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const SwitchWid({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: value,
          onChanged: onChanged,
        ),
        const Text('Are You 18+'),
      ],
    );
  }
}
