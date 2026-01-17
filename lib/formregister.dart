import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: RegisterForm(),
  ));
}
class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool agreed = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  bool get isFormValid {
    return _formKey.currentState?.validate() == true && agreed;
  }

  void submit() {
    print('===== REGISTER DATA =====');
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');
    print('Confirm: ${confirmController.text}');
    print('Agreed: $agreed');
    print('=========================');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          onChanged: () {
            setState(() {}); // cập nhật trạng thái nút
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// EMAIL
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email không được để trống';
                  }
                  if (!value.contains('@')) {
                    return 'Email không hợp lệ';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              /// PASSWORD
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password không được để trống';
                  }
                  if (value.length < 6) {
                    return 'Password ít nhất 6 ký tự';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              /// CONFIRM PASSWORD
              TextFormField(
                controller: confirmController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Password không khớp';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              /// CHECKBOX
              Row(
                children: [
                  Checkbox(
                    value: agreed,
                    onChanged: (value) {
                      setState(() {
                        agreed = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text('Tôi đồng ý với điều khoản sử dụng'),
                  ),
                ],
              ),

              SizedBox(height: 24),

              /// SUBMIT BUTTON
              ElevatedButton(
                onPressed: isFormValid ? submit : null,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
