import 'package:first_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget{
  LoginPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return "Please enter a valid email";
                }
                return null;
              }
            ),
            const SizedBox(height: 12,),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              }
            ),
            const SizedBox(height: 20,),
            if (auth.error != null)
              Text(
                auth.error!,
                style: const TextStyle(color: Colors.red),
              ),
            auth.isLoading ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                auth.login(
                  _emailController.text,
                  _passwordController.text,
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20,),
            if (auth.isLoggedIn)
              Text(
                "Welcome ${auth.user!.fullName}",
                style: const TextStyle(fontSize: 20),
              )
          ],
        ),
      ),
    );
  }
  bool get isFormValid {
    return _formKey.currentState!.validate();
  }
}