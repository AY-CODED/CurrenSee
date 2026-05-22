import 'dart:async';
// import 'package:currensee/screens/signup_screen.dart';
import 'sign_in.dart';
import 'package:flutter/material.dart';
// import 'sign_in.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

/*
  StatefulWidget is used here because we want to run code
  after the screen has loaded.
*/
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 249, 251),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3)
                  )
                ]
              ),
              // transform: Matrix4.rotationZ(0.8),
              child: const Icon(
                Icons.currency_exchange,
                color: Color.fromARGB(255, 74, 36, 192),
                size: 38,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'CurrenSee',
              style: TextStyle(
                color: Color.fromARGB(255, 74, 36, 192),
                fontSize: 36,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'PRECISION FINANCE',
              style: TextStyle(
                color: Color.fromARGB(255, 47, 49, 61),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),
            Container(
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: const LinearProgressIndicator(
                  color: Color.fromARGB(255, 74, 36, 192),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
