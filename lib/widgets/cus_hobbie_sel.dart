import 'package:flutter/material.dart';

class CustomHobbiesSelector extends StatefulWidget {
  final ValueChanged<List<String>> onHobbiesChanged;

  const CustomHobbiesSelector({Key? key, required this.onHobbiesChanged})
      : super(key: key);

  @override
  _CustomHobbiesSelectorState createState() => _CustomHobbiesSelectorState();
}

class _CustomHobbiesSelectorState extends State<CustomHobbiesSelector> {
  final List<String> _selectedHobbies = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const Text('Hobbies:'),
          const SizedBox(width: 16.0),
          Row(
            children: _buildHobbiesCheckboxes(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHobbiesCheckboxes() {
    final List<String> hobbies = [
      'Reading',
      'Traveling',
      'Coding',
      'Cooking',
      'Music'
    ];

    return hobbies.map((hobby) {
      return Row(
        children: [
          Checkbox(
            value: _selectedHobbies.contains(hobby),
            onChanged: (value) {
              setState(() {
                if (value!) {
                  _selectedHobbies.add(hobby);
                } else {
                  _selectedHobbies.remove(hobby);
                }
                widget.onHobbiesChanged(_selectedHobbies);
              });
            },
          ),
          Text(hobby),
        ],
      );
    }).toList();
  }
}
