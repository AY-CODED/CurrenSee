import 'package:currensee/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:currensee/auth/firebase/auth.dart';
import 'package:currensee/widgets/_buildTextField.dart';
import 'package:currensee/screens/home_screen.dart';
// Add your import for the Auth class file
// import 'package:currensee/services/auth.dart'; 

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Initialize your Auth service
  final Auth _auth = Auth();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false;

 Future<void> _signUp() async {
  if (_passwordController.text != _confirmPasswordController.text) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
    return;
  }

  setState(() => _isLoading = true);

  try {
    await _auth.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    // After success, navigate to HomeScreen
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  } catch (e) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
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
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text('CurrenSee', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF5D3FD3))),
              const SizedBox(height: 10),
              const Text('Join CurrenSee', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Text('The prestige of secure wealth.', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextField(
                    label: 'Full Name', 
                    hint: 'Alexander Sterling'
                  ),
                  CustomTextField(
                    label: 'Email', 
                    hint: 'alex@premium.com', 
                    controller: _emailController
                  ),
                  CustomTextField(
                    label: 'Password', 
                    hint: '••••••••', 
                    obscure: true, 
                    controller: _passwordController
                  ),
                  CustomTextField(
                    label: 'Confirm', 
                    hint: '••••••••', 
                    obscure: true, 
                    controller: _confirmPasswordController
                  ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity, 
                      height: 50, 
                      child: ElevatedButton(
                      onPressed: _isLoading ? null : _signUp,
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF5D3FD3)),
                      child: Text(
                        _isLoading ? 'Signing Up...' : 'Sign Up',
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                    const SizedBox(height: 20),
                    Row(children: [const Expanded(child: Divider()), const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('OR CONTINUE WITH')), const Expanded(child: Divider())]),
                    const SizedBox(height: 20),
                    Row(children: [Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.g_mobiledata,), label: const Text('Google'))), const SizedBox(width: 10), Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.apple,), label: const Text('Apple')))]),
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
                        },
                        child: const Text('Already have an account? Log In'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.lock_outline, size: 14, color: Colors.grey), SizedBox(width: 5), Text('End-to-end institutional grade encryption', style: TextStyle(color: Colors.grey))])
            ],
          ),
        ),
      ),
    );
  }
}