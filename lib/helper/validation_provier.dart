class ValidationProvider {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    }
    return null; // Name is valid
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r"^[a-z0-9+_.-]+@[a-z0-9.-]+$").hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null; // Email is valid
  }

  static String? validateMobileNumber(String mobileNumber) {
    final phoneRegex = RegExp(r'^\+91[6-9]\d{9}$');
    return phoneRegex.hasMatch(mobileNumber)
        ? null
        : 'Please enter a valid Indian phone number.';
  }

  static String? validateDropdown(String? value) {
    return value != null && value.isNotEmpty
        ? null
        : 'Please select an option from the dropdown.';
  }

  static String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Address cannot be empty';
    } else if (value.length > 250) {
      return 'Address cannot be more than 250 characters';
    } else if (value.length < 50) {
      return 'Address cannot be less than 50 characters';
    }
    return null; // Address is valid
  }

  static String? validateUserType(String value) {
    if (value == 'Select Type') {
      return 'Please select a user type';
    }
    return null; // User type is valid
  }

  static String? validateGender(String value) {
    if (value.isEmpty) {
      return 'Please select a gender';
    }
    return null; // Gender is valid
  }

  static String? validateHobbies(List<String> hobbies) {
    if (hobbies.isEmpty) {
      return 'Please select at least one hobby';
    }
    return null; // Hobbies are valid
  }

  static final pincodeRegex = RegExp(r'^\d{6}$');

  static String? validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return 'PIN code is required';
    } else if (!pincodeRegex.hasMatch(value)) {
      return 'Enter a valid 6-digit PIN code';
    }
    return null;
  }

  static String? validateSwitch(bool value) {
    return value ? null : 'Please toggle the switch.';
  }

  static String? validatePassword(String value) {
    final passwordRegex = RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$');
    return passwordRegex.hasMatch(value)
        ? null
        : 'Password must be at least 8 characters long and include letters, numbers, and at least one special character.';
  }
}
