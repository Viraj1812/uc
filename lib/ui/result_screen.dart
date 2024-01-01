import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String userType;
  final String gender;
  final bool switchValue;
  final String pincode;
  final String password;
  final List<String> ls;

  const ResultScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.userType,
    required this.gender,
    required this.switchValue,
    required this.pincode,
    required this.ls,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    String checkBoxValue = '';

    for (var element in ls) {
      checkBoxValue += element;
      checkBoxValue += '/';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('name: $name'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Dropdown Value: $userType'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Phone No: $phone'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Address: $address'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Email: $email'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Pincode: $pincode'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Password: $password'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Radio Value: ${gender.toString()}'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Switch Value: ${switchValue.toString()}'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Weight Progress: $checkBoxValue'),
            ),
          ],
        ),
      ),
    );
  }
}
