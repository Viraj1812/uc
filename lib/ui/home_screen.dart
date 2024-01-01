import 'package:flutter/material.dart';
import 'package:uc/helper/validation_provier.dart';
import 'package:uc/ui/result_screen.dart';
import 'package:uc/widgets/cus_drop_down.dart';
import 'package:uc/widgets/cus_gender_sel.dart';
import 'package:uc/widgets/cus_hobbie_sel.dart';
import 'package:uc/widgets/cus_textform_field.dart';
import 'package:uc/widgets/switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _selectedUserType = 'Select Type';
  String _selectedGender = '';
  bool switchV = false;
  final List<String> _selectedHobbies = [];
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  FocusNode f6 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controller'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  labelText: 'Name',
                  focusNode: f1,
                  onFieldSubmitted: () {
                    FocusScope.of(context).requestFocus(f2);
                  },
                  validator: (value) => ValidationProvider.validateName(value!),
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Email',
                  focusNode: f2,
                  onFieldSubmitted: () {
                    FocusScope.of(context).requestFocus(f3);
                  },
                  validator: (value) =>
                      ValidationProvider.validateEmail(value!),
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: _mobileController,
                  labelText: 'Mobile Number',
                  focusNode: f3,
                  onFieldSubmitted: () {
                    FocusScope.of(context).requestFocus(f4);
                  },
                  validator: (value) =>
                      ValidationProvider.validateMobileNumber(value!),
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: _addressController,
                  labelText: 'Address',
                  validator: (value) =>
                      ValidationProvider.validateAddress(value!),
                  focusNode: f4,
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: _pincodeController,
                  labelText: 'Pincode',
                  validator: (value) =>
                      ValidationProvider.validatePincode(value!),
                  focusNode: f5,
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                  validator: (value) =>
                      ValidationProvider.validatePassword(value!),
                  focusNode: f6,
                ),
                const SizedBox(height: 16.0),
                CustomDropdownFormField(
                  value: _selectedUserType,
                  onChanged: (value) {
                    setState(() {
                      _selectedUserType = value!;
                    });
                  },
                  validator: (value) =>
                      ValidationProvider.validateUserType(value!),
                  items: const ['Select Type', 'Admin', 'User', 'Super Admin'],
                  labelText: 'User Type',
                ),
                const SizedBox(height: 16.0),
                CustomGenderSelector(
                  onGenderChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                SwitchWid(
                  value: switchV,
                  onChanged: (value) {
                    setState(() {
                      switchV = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                CustomHobbiesSelector(
                  onHobbiesChanged: (selectedHobbies) {
                    setState(() {
                      _selectedHobbies.clear();
                      _selectedHobbies.addAll(selectedHobbies);
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String? validationResult =
          ValidationProvider.validateGender(_selectedGender);

      if (validationResult != null) {
        _showToast(context, validationResult);
      } else if (_selectedHobbies.length < 2) {
        _showToast(context, 'Please select more than 2 hobbies');
      } else if (ValidationProvider.validateSwitch(switchV) != null) {
        _showToast(
            context, ValidationProvider.validateSwitch(switchV).toString());
      } else {
        String name = _nameController.text;
        String email = _emailController.text;
        String phoneNumber = _mobileController.text;
        String address = _addressController.text;
        String userType = _selectedUserType;
        String gender = _selectedGender;
        String pincode = _pincodeController.text;
        String password = _passwordController.text;
        List<String> hob = _selectedHobbies;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              name: name,
              email: email,
              phone: phoneNumber,
              address: address,
              userType: userType,
              gender: gender,
              switchValue: switchV,
              pincode: pincode,
              password: password,
              ls: hob,
            ),
          ),
        );
        _showToast(context, 'REGISTRATION SUCCESSFUL');
      }
    }
  }

  void _showToast(BuildContext context, String message) {
    var snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      elevation: 20,
      showCloseIcon: true,
      closeIconColor: Colors.red,
      dismissDirection: DismissDirection.horizontal,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
