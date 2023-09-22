import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _secondPassController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              //photo
              // Center(
              //   child: ClipOval(
              //     child: Container(
              //       color: Colors.black,
              //       child: const Text("Add Photo"),
              //     ),
              //   ),
              // ),
              InkWell(
                child: Center(
                  child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // Background color
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Add\nPhoto",
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
                onTap: () {},
              ),

              SizedBox(
                height: screenHeight * 0.01,
              ),
              //email
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
              const SizedBox(
                child: Text(
                  "New Password",
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
                        child: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),

              const SizedBox(
                child: Text(
                  "Re-type Password",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              SizedBox(
                width: screenWidth,
                child: TextFormField(
                  controller: _secondPassController,
                  // textAlign: TextAlign.center,
                  obscureText: true,
                  obscuringCharacter: '●',
                  style: const TextStyle(
                    color: Color(0xFF393939),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    hintText: '●●●●●●●',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF837E93),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.08,
                  child: ElevatedButton(
                    onPressed: () {},
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
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
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
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              // const Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Text("Bottom text"),
              // )
            ],
          )),
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(children: [
              TextSpan(
                  text: "By creating an account, you agree to Koko's \n",
                  style: TextStyle(
                    fontSize: 12,
                    // fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
              TextSpan(
                  text: "Terms of Use ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange,
                  )),
              TextSpan(
                  text: "and ",
                  style: TextStyle(
                    fontSize: 12,
                    // fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
              TextSpan(
                  text: "Privacy",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange,
                  )),
            ]),
          ),
        ));
  }
}
