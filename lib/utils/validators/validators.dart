class Validators {
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    // final phoneRegExp = RegExp(r'^\d{13}$');

    // if (!phoneRegExp.hasMatch(value)) {
    //   return 'Invalid Phone Number Format .13 digits Required';
    // }

    return null;
  }

  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the name.';
    }

    return null;
  }

  ///empty textfield validation
  static String? validateEmptyText(String? fieldname, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldname is required';
    }
    return null;
  }
}
