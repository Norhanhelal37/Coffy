import 'package:coffy/screens/navigator_home.dart';
import 'package:coffy/screens/register_screen.dart';
import 'package:coffy/widgets/custome_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool value = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEAD8C0),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Container(
                height: 550,
                width: 350,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomeField(
                      title: "Email",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomeField(
                      title: "password",
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: value,
                          onChanged: (valu) {
                            setState(() {
                              value = valu!;
                            });
                          },
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        const Text(
                          "Forget Password",
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigatorHome()));
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.black),
                            minimumSize: WidgetStatePropertyAll(Size(200, 50))),
                        child: const Text(
                          "LogIn",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
