import 'package:code_queez/core/config/extension.dart';
import 'package:code_queez/core/config/route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.screenHeight * 0.2, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Login Screen',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildForm(
                title: 'Email',
                controller: _emailCont,
                icon: Icon(
                  Icons.email,
                  size: 20,
                  color: context.tealGreen.withOpacity(0.8),
                ),
                hintText: 'example@gmail.com',
              ),
              const SizedBox(height: 16),
              _buildForm(
                title: 'Password',
                controller: _passwordCont,
                isPassword: true,
                icon: Icon(
                  Icons.lock,
                  size: 20,
                  color: context.tealGreen.withOpacity(0.8),
                ),
                hintText: 'Masukkan password disini',
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: context.textTheme.bodySmall,
                    children: [
                      TextSpan(
                        text: 'Register Here',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context)
                              .pushNamed(MyRouter.routeRegister),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: context.tealGreenDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm({
    required String title,
    required TextEditingController controller,
    String hintText = '',
    bool isPassword = false,
    Icon? icon,
  }) {
    return TextFormField(
      cursorColor: context.tealGreen,
      style: context.textTheme.bodyMedium,
      obscureText: isPassword == true,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 1,
            style: BorderStyle.solid,
            color: context.tealGreen.withOpacity(0.5),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 1,
            style: BorderStyle.solid,
            color: Colors.grey.withOpacity(0.3),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            style: BorderStyle.solid,
            color: context.tealGreen,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 1,
            style: BorderStyle.solid,
            color: context.tealGreen.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        prefixIcon: icon,
      ),
    );
  }
}
