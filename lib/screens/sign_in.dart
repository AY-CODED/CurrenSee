import 'dart:ffi';

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              crossAxisAlignment: CrossAxisAlignment.start, // Keeps structural alignments uniform
              children: [

                Container(
                  height: 220, // Slightly increased height to avoid squeezing text with Spacer
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
                          child: const Icon(Icons.auto_awesome, color: Colors.white, size: 30),
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
                        const SizedBox(height: 4), // Replaced massive height gap with clean spacing
                        const Text(
                          "Premium financial experiences.",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // const SizedBox(height: 30),

                // IMPROVEMENT: Improved paragraph text readability and styling
                Padding(padding: const EdgeInsets.all(25),
                  child:
                  Column(
                    children: [
                     Container(
                       color: Colors.white,
                      height: 150,
                      child:
                      const Center(
                      child: Text(
                      'Reliable, accurate, and instant\nfinancial data for your global\ntransactions',
                      textAlign: TextAlign.center, // Centers the actual lines of text cleanly
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Inter', // Capitalized 'Inter' (matching typical pubspec configuration)
                        fontSize: 16,
                        height: 1.5, // Improves line spacing for reading comfort
                        fontWeight: FontWeight.w600,
                      ),
                      ),

                      ),


                     ),
                    ],
                  )
                )
               ],
            ),
          ),
        ),
      ),
    );
  }
}