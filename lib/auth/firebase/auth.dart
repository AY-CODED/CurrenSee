import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  // Firebase instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Google Sign In singleton (v7+)
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Auth() {
    // Required initialization for google_sign_in v7+
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    await _googleSignIn.initialize();
  }

  // Current user
  User? get currentUser => _firebaseAuth.currentUser;

  // Auth state stream
  Stream<User?> get authStateChanges =>
      _firebaseAuth.authStateChanges();

  // =========================
  // EMAIL SIGN IN
  // =========================
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // =========================
  // CREATE ACCOUNT
  // =========================
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // =========================
  // GOOGLE SIGN IN
  // =========================
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Authenticate user
      final GoogleSignInAccount googleUser =
          await _googleSignIn.authenticate();

      // Request scopes for access token
      final GoogleSignInClientAuthorization? authorization =
          await googleUser.authorizationClient.authorizeScopes([
        'email',
        'profile',
      ]);

      // Access token
      final String? accessToken = authorization?.accessToken;

      // Get ID token
      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      // Create Firebase credential
      final OAuthCredential credential =
          GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign into Firebase
      return await _firebaseAuth.signInWithCredential(
        credential,
      );
    } catch (e) {
      throw FirebaseAuthException(
        code: 'google-sign-in-failed',
        message: e.toString(),
      );
    }
  }

  // =========================
  // APPLE SIGN IN
  // =========================
  Future<UserCredential> signInWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();

      if (kIsWeb) {
        return await _firebaseAuth.signInWithPopup(
          appleProvider,
        );
      } else {
        return await _firebaseAuth.signInWithProvider(
          appleProvider,
        );
      }
    } catch (e) {
      throw FirebaseAuthException(
        code: 'apple-sign-in-failed',
        message: e.toString(),
      );
    }
  }

  // =========================
  // SIGN OUT
  // =========================
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}