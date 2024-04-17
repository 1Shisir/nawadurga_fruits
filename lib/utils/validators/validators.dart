class Validators {
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "phone number is required";
    }

    // final phoneRegExp = RegExp(r'^\d{13}$');

    // if (!phoneRegExp.hasMatch(value)) {
    //   return 'Invalid Phone Number Format .13 digits Required';
    // }

    return null;
  }
}
