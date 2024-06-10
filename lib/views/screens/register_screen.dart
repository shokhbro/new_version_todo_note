import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_note_project/services/auth_http_services.dart';
import 'package:todo_note_project/views/screens/home_screen.dart';
import 'package:todo_note_project/views/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final _authHttpServices = AuthHttpServices();
  String? email, password, passwordConfirm;
  bool isLoading = false;

  void submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }

    setState(() {
      isLoading = true;
    });

    try {
      await _authHttpServices.register(email!, password!);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return const HomeScreen();
          },
        ),
      );
    } catch (e) {
      String message = e.toString();
      if (e.toString().contains("EMAIL_EXISTS")) {
        message = "Bunday email allaqachon ro'yhatdan o'tkan";
      }
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Xatolik"),
            content: Text(message),
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
          "Register Screen",
          style: TextStyle(fontFamily: 'Lato'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
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
                  controller: passwordController,
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
                const Gap(15),
                TextFormField(
                  controller: passwordConfirmController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'parolni tasdiqlash',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "iltimos parolni tasdiqlang";
                    }
                    if (passwordController.text !=
                        passwordConfirmController.text) {
                      return 'parollar bir xil emas!';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    passwordConfirm = newValue;
                  },
                ),
                const Gap(20),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : FilledButton(
                        onPressed: submit,
                        child: const Text("Ro'yxatdan o'tish"),
                      ),
                const Gap(20),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) {
                      return const LoginScreen();
                    }));
                  },
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
