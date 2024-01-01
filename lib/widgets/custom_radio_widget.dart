import 'package:flutter/material.dart';

class CustomGenderSelector extends StatefulWidget {
  final ValueChanged<String> onGenderChanged;

  const CustomGenderSelector({Key? key, required this.onGenderChanged})
      : super(key: key);

  @override
  _CustomGenderSelectorState createState() => _CustomGenderSelectorState();
}

class _CustomGenderSelectorState extends State<CustomGenderSelector> {
  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Gender:'),
        const SizedBox(width: 16.0),
        Row(
          children: [
            Radio(
              value: 'Male',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value as String;
                  widget.onGenderChanged(_selectedGender);
                });
              },
            ),
            const Text('Male'),
            Radio(
              value: 'Female',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value as String;
                  widget.onGenderChanged(_selectedGender);
                });
              },
            ),
            const Text('Female'),
          ],
        ),
      ],
    );
  }
}
