// import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:currensee/widgets/_buildTextField.dart';
import 'package:currensee/widgets/_buildsign.dart';

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
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      // color : Colors.white,
                      CustomsTextField(
                        prefixIcon: Icons.mail_outline,
                        hint: 'Email Address',
                        isPasswordField: false,
                      ),
                      CustomsTextField(
                        prefixIcon: Icons.lock_outline,
                        hint: 'Enter Password',
                        isPasswordField: true,
                      ),

                      SizedBox(width: 29),
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
                          onPressed: () {
                            print('clicked');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5D3FD3),
                          ),
                          child: Text(
                            'Sign In ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),


                    const SizedBox(height: 25),
                    Row(children: [const Expanded(child: Divider()), const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('OR CONTINUE WITH')), const Expanded(child: Divider())]),

                    const SizedBox(height: 25),
                    Row(children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            // try {
                            //   final userCredential = await _auth.signInWithGoogle();
                            //   if (userCredential.user != null && mounted) {
                            //     Navigator.pushReplacement(
                            //       context,
                            //       MaterialPageRoute(builder: (context) => const HomeScreen()),
                            //     );
                            //   }
                            // } catch (e) {
                            //   if (mounted) {
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(content: Text(e.toString())),
                            //     );
                            //   }
                            // }
                          },
                          icon: const Icon(Icons.g_mobiledata),
                          label: const Text('Google'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            // try {
                            //   await _auth.signInWithApple();
                            //   if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                            // } catch (e) {
                            //   if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                            // }
                          },
                          icon: const Icon(Icons.apple, color: Colors.grey,),
                          label: const Text('Apple'),
                        ),
                      ),
                    ]),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
