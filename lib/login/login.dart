// ignore_for_file: use_build_context_synchronously, unused_import, unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job/dashboard/dashboard.dart';
import 'package:job/login/register.dart';
import 'package:http/http.dart' as http;
import 'package:job/util/global.dart';
import 'package:job/util/loading_circle.dart';
import 'package:job/util/hard_code_list.dart' as hcl;

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });
  //  required this.controller
  // final PageController controller;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _isLoading = false;

  String? email, password;

  Future attemptLogin(String username, String password) async {
    var res = await http.post(
      Uri.parse("$SERVER_IP/api/auth/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "password": password,
      }),
    );

    var loginMessage = jsonDecode(res.body);

    // ignore: unused_local_variable
    Map<String, dynamic> responseMap = json.decode(res.body);
    if (res.statusCode == 200) {
      // DO LOGIN STUFF
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const JobDashboard()),
      );
    } else {
      showSnackBar(context, "error", loginMessage['msg']);
    }
  }

  // simulate login
  Future login(String email, String password) async {
    // assume delay from retrieving data for login
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      if (hcl.userEmail == email && hcl.password == password) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const JobDashboard()),
        );
        showSnackBar(context, "success", "Successfully Logged In");
      } else {
        showSnackBar(context, "error", "Wrong email or password, try again");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  SizedBox(
                    height: screenHeight * 0.15,
                  ),
                  Center(
                      child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Job',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                            )),
                        TextSpan(
                            text: 'box',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ],
                    ),
                  )),
                  SizedBox(
                    height: screenHeight * 0.10,
                  ),
                  const SizedBox(
                    child: Text(
                      "Email",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  SizedBox(
                    width: screenWidth,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'example@mail.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF837E93),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter email.";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  // LoadingCircle(isLoading: _isLoading),
                  const SizedBox(
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  SizedBox(
                    width: screenWidth,
                    child: TextFormField(
                      controller: _passController,
                      obscureText: _obscureText,
                      style: const TextStyle(
                        color: Color(0xFF393939),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: '●●●●●●●',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF837E93),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.orange,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password.";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  _isLoading
                      ? LoadingCircle(
                          isLoading: _isLoading,
                          loadingColor: Colors.orange,
                        )
                      : ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: SizedBox(
                            width: screenWidth,
                            height: screenHeight * 0.08,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const JobDashboard()),
                                );
                                // final FormState? form = _formKey.currentState;
                                // if (form!.validate()) {
                                //   login(email!, password!);
                                // } else {}
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          color: Color(0xFF837E93),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 2.5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
