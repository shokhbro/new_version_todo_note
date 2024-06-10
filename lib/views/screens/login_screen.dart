import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_note_project/services/auth_http_services.dart';
import 'package:todo_note_project/views/screens/forgot_password.dart';
import 'package:todo_note_project/views/screens/home_screen.dart';
import 'package:todo_note_project/views/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final authHttpServices = AuthHttpServices();
  bool isLoading = false;

  String? email;
  String? password;

  void submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
    setState(() {
      isLoading = true;
    });

    try {
      await authHttpServices.login(email!, password!);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) {
          return const HomeScreen();
        }),
      );
    } catch (e) {
      String message = e.toString();

      if (e.toString().contains("INVALID_LOGIN_CREDENTIALS")) {
        message = "Bunday email hali ro'yhatdan o'tmagan";
      }

      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Xatolik"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login Screen",
          style: TextStyle(fontFamily: 'Lato'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "iltimos email kiriting";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    email = newValue;
                  },
                ),
                const Gap(15),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'parol',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "iltimos parol kiriting";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    password = newValue;
                  },
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (ctx) {
                          return const ForgotPasswordScreen();
                        }));
                        setState(() {});
                      },
                      child: const Text("Parol esdan chiqdimi?"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) {
                              return const RegisterScreen();
                            },
                          ),
                        );
                      },
                      child: const Text("Ro'yxatdan O'tish"),
                    ),
                  ],
                ),
                const Gap(30),
                isLoading
                    ? const CircularProgressIndicator()
                    : FilledButton(
                        onPressed: submit,
                        child: const Text("Tizimga kirish"),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
