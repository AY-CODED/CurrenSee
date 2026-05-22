import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
// Note: mobile Google Sign-In configuration removed to avoid API mismatch

class Auth {
  // Dependencies Instances
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Initializing GoogleSignIn with explicit scopes
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard(
    scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
  );

  // Expose current authenticated user instance
  User? get currentUser => _firebaseAuth.currentUser;

  // Stream listening to real-time auth state updates
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// EMAIL & PASSWORD SIGN IN
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// REGISTER WITH EMAIL & PASSWORD
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// GOOGLE SIGN IN (Cross-Platform Ready)
  Future<UserCredential> signInWithGoogle() async {
    try {
      // 1. Web Platform Workflow
      if (kIsWeb) {
        final googleProvider = GoogleAuthProvider();
        return await _firebaseAuth.signInWithPopup(googleProvider);
      }

      // 2. Mobile Platforms Workflow (Android/iOS)
      // Mobile native Google Sign-In must be implemented using the
      // `google_sign_in` package. To avoid depending on a specific
      // package version here, the mobile flow is left as a TODO.
      throw UnimplementedError(
        'Mobile Google Sign-In is not configured. Add google_sign_in integration.',
      );

      if (googleUser == null) {
        throw Exception('Sign-in cancelled by user.');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception('Google Sign-In Exception: $e');
    }
  }

  /// APPLE SIGN IN
  Future<UserCredential> signInWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      if (kIsWeb) {
        return await _firebaseAuth.signInWithPopup(appleProvider);
      } else {
        return await _firebaseAuth.signInWithProvider(appleProvider);
      }
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception('Apple Sign-In Exception: $e');
    }
  }

  /// GLOBAL SIGN OUT
  Future<void> signOut() async {
    try {
      // If using `google_sign_in`, sign out from it here.
    } catch (_) {}
    await _firebaseAuth.signOut();
  }
}
