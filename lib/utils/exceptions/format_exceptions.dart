class CustomFormatExceptions implements Exception {
  final String message;

  const CustomFormatExceptions(
      [this.message =
          'An unexpected format error occurred.Please check your input.']);

  factory CustomFormatExceptions.frommessage(String message) {
    return CustomFormatExceptions(message);
  }

  String get formattedMessage => message;

  factory CustomFormatExceptions.fromCode(String code) {
    switch (code) {
      case 'invalid-email-address':
        return const CustomFormatExceptions(
            'This email address format is invalid.Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const CustomFormatExceptions(
            'The provide phone number format is invalid.Please enter a valid number.');
      case 'invalid-date-format':
        return const CustomFormatExceptions(
            'The date format is invalid.Please enter a valid date.');
      case 'invalid-url-format':
        return const CustomFormatExceptions(
            'The url format is invalid.Please enter a valid url.');
      case 'invalid-credit-card-format':
        return const CustomFormatExceptions(
            'The credit card foramt is invalid.Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const CustomFormatExceptions(
            'The input should be a valid numeric format');

      default:
        return const CustomFormatExceptions();
    }
  }
}
