class CustomPlatformExceptions implements Exception {
  final String code;

  CustomPlatformExceptions(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid Login credentials.Please check your information.';
      case 'too-many-requests':
        return 'Too many requests.Please try again later.';
      case 'invalid-argument':
        return 'Invalid argument is provided to the authentication method.';
      case 'invalid-password':
        return 'Incorrect password.Please try again';
      case 'invalid-phone-number':
        return 'The Provided phone number is invalid.';
      case 'operation-not-allowed':
        return 'The sign in provider is disabled for your firebase project.';
      case 'session-cookie-expired':
        return 'The firebase session cookie has expired.Please sign in again.';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by other user.';
      case 'sign_in_failed':
        return 'sign-in failed.Please try again.';
      case 'network-request-failed':
        return 'Network request failed.Please check your internet connection.';
      case 'internal-error':
        return 'Internal error.Please try again later.';
      case 'invalid-verification-code':
        return 'Invalid verificationcode.Please enter a valid one.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded.Please try again later.';

      //remember to add more as needed
      default:
        return 'An unexpected platform error occured.Please try again';
    }
  }
}
