class CustomFirebaseException implements Exception {
  final String code;

  CustomFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error has occurred.Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect.Please check your custom token.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'user-not-found':
        return 'No user found for the given email or UID.';
      case 'invalid-email':
        return 'The email address provided is invalid.Please enter a valid email.';
      case 'email-already-in-use':
        return 'The email is already registered.Please use a different email.';
      case 'wrong-password':
        return 'Incorrect password.Please check your password and try again.';
      case 'weak-password':
        return 'The password is too weak.Please choose a stronger password.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.Contact support for assistance.';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'invalid-verification-code':
        return 'Invalid verification code.Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID.Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded.Please try again later.';
      case 'email-already-exists':
        return 'This email address already exists.Please use a different email.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication.Please login again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user aaccount.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'account-exists-with-different-credentials':
        return 'An Account already exists with the same email but different sign-in credentials';
      case 'expired-action-code':
        return 'Yhe action code has expired.Please reqquest a new action code.';
      case 'invalid-action-code':
        return 'The action code is invalid.Please check the code and try again.';
      case 'missing-action-code':
        return 'The action code is missing.Please provide a valid action code.';
      case 'user-token-expired':
        return 'The user\'s token has expired,and authentication is required.Please sign in again.';
      case 'invalid-credentials':
        return 'The supplied credentials is malformed or has expired.';
      case 'user-token-revoked':
        return 'The user\'s token has been revoked.Please sign in again.';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';
      case 'invalid-sender':
        return 'The email template sender is invalid.Please verify the sender\'s email.';
      case 'invalid-recipient-email':
        return 'The email template receiver is invalid.Please verify the receiver\'s email.';
      case 'missing-iframe-start':
        return 'The email template is missing the iframe start tag.';
      case 'missing-iframe-end':
        return 'The email template is missing the iframe end tag.';
      case 'missing-iframe-src':
        return 'The email template is missing the iframe src attribute.';
      case 'auth-domain-config-required':
        return 'The authDomain configuration is required for the action code verification.';
      case 'missing-app-credential':
        return 'The app credential is missing.Please provide the valid app credentials.';
      case 'invalid-app-credential':
        return 'The app credential is invalid.Please provide the valid app credentials.';
      case 'session-cookie-expired':
        return 'The firebase session cookie has expired.Please sign in again.';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'invalid-cordova-configuration':
        return 'The provided cordova configuration is invalid.';
      case 'app-deleted':
        return 'This instance of FirebaseApp has been deleted.';
      case 'user-token-mismatch':
        return 'The provided user\'s token has a mismatch with the authenticated user\'s ID.';
      case 'web-storage-unsupported':
        return 'Web storage is not supported or is disabled.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key.';
      case 'keychain-error':
        return 'A keychain error occurred.Please check the keychain and try again.';
      case 'internal -error':
        return 'An internal authentication error occurred.Please try again later.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials.';
      case 'credentials-already-in-use':
        return 'This credential is already associated with a different user account.';

      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
