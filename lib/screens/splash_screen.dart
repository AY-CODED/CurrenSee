import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

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

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
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
            SizedBox(
              width: 90, // set desired width
              child: LinearProgressIndicator(
                color: Color.fromARGB(255, 74, 36, 192),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
