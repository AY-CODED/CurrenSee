import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn ({super.key});

  @override
    State<SignIn> createState() => _SignInState();

}

class _SignInState extends State<SignIn>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:SingleChildScrollView(

        child:Padding(padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple, // Use a gradient for the wave effect
                borderRadius:BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30), ),

                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.deepPurple.shade900, Colors.deepPurple.shade700],
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
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.auto_awesome, color: Colors.white, size: 30),
                    ),
                    const Spacer(),
                    const SizedBox(height: 20,),
                    const Text(
                      "CurrenSee",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
            )
          ],
        ) ,

        ),
      )

      ),
    );
  }
}