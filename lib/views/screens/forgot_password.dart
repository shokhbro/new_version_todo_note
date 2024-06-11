import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_note_project/services/auth_http_services.dart';
import 'package:todo_note_project/views/screens/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPasswordScreen> {
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
      await authHttpServices.resetPassword(email!);

      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Parolni tiklash"),
            content: const Text("Emailingizga xabar yuborildi"),
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
    } on Exception catch (e) {
      String message = e.toString();

      if (e.toString().contains("INVALID_LOGIN_CREDENTIALS")) {
        message = "Bunday email hali ro'yhatdan o'tmagan";
      }
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
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) {
                  return const LoginScreen();
                }));
              },
              icon: const Icon(CupertinoIcons.back),
            ),
          ],
        ),
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                const Gap(30),
                isLoading
                    ? const CircularProgressIndicator()
                    : FilledButton(
                        onPressed: submit,
                        child: const Text("Yuborish"),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
