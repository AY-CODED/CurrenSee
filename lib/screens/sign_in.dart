// import 'dart:ffi';

import 'package:currensee/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:currensee/auth/firebase/auth.dart';
// import 'package:currensee/widgets/_buildTextField.dart';
import 'package:currensee/widgets/_buildsign.dart';
import 'package:currensee/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
final Auth _auth = Auth();

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
// final TextEditingController _confirmPasswordController = TextEditingController();

bool _isLoading = false;

Future<void> _signIn() async {
  if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please enter both email and password")),
    );
    return;
  }

  setState(() => _isLoading = true);

  try {
    await _auth.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  } on FirebaseAuthException catch (e) {
    String message;
    if (e.code == 'user-not-found') {
      message = "No account found for that email.";
    } else if (e.code == 'wrong-password') {
      message = "Incorrect password provided.";
    } else if (e.code == 'invalid-email') {
      message = "The email address is invalid.";
    } else {
      message = e.message ?? "An error occurred during sign in.";
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  } catch (e) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  } finally {
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CRITICAL FIX 1: Set background color on the Scaffold instead of the Column
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Keeps structural alignments uniform
              children: [
                Container(
                  height:
                      220, // Slightly increased height to avoid squeezing text with Spacer
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      // CRITICAL FIX 2: Fixed asset path (remove '../')
                      image: AssetImage('../assets/img.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Color.fromRGBO(69, 30, 187, 0.6),
                        BlendMode.srcOver,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.1),
                            border: Border.all(
                              color: const Color.fromRGBO(255, 255, 255, 0.2),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.currency_exchange,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "CurrenSee",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ), // Replaced massive height gap with clean spacing
                        const Text(
                          "Premium financial experiences.",
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),

                // const SizedBox(height: 30),

                // IMPROVEMENT: Improved paragraph text readability and styling
              Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.08),
        blurRadius: 20,
        spreadRadius: 2,
        offset: const Offset(0, 8),
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.all(25),
    child: Column(
      children: [
        CustomsTextField(
          controller: _emailController,
          prefixIcon: Icons.mail_outline,
          hint: 'Email Address',
          isPasswordField: false,
        ),
        CustomsTextField(
          controller: _passwordController,
          prefixIcon: Icons.lock_outline,
          hint: 'Enter Password',
          isPasswordField: true,
        ),
        const SizedBox(width: 29),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "FORGOT PASSWORD",
              style: TextStyle(
                color: Color.fromRGBO(69, 30, 187, 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _signIn,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5D3FD3),
            ),
            child: _isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 25),
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('OR CONTINUE WITH'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () async {},
                icon: const Icon(Icons.g_mobiledata),
                label: const Text('Google'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () async {},
                icon: const Icon(Icons.apple, color: Colors.grey),
                label: const Text('Apple'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account? "),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector( 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color(0xFF5D3FD3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
)   ],
                ),
          ),
        ),
      ),
    );
  }
}
