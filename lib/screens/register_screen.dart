import 'package:coffy/screens/login_screen.dart';
import 'package:coffy/screens/navigator_home.dart';
import 'package:coffy/widgets/custome_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                height: 590,
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
                      "Sign Up",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomeField(title: "First name"),
                    const SizedBox(height: 10,),
                    const CustomeField(title: "Last name"),
                    const CustomeField(
                      title: "Email",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomeField(
                      title: "password",
                    ),
                    const SizedBox(height: 10,),
                    const CustomeField(title: "confirm password"),
                   
                    const SizedBox(
                      height: 10,
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
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                       
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: const Text(
                              "Sign in",
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