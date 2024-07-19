import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:tadbiro_ap/services/login/auth_htpp_services.dart';
import 'package:tadbiro_ap/ui/screens/login/sign_in.dart';
import 'package:tadbiro_ap/ui/screens/login/user_name.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscureIsDoneP = true;
  bool obscureIsDoneC = true;
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _emailController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  bool checkEmail = false;
  @override
  Widget build(BuildContext context) {
    final authHtppServices = Provider.of<AuthHtppServices>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: ListView(
        children: [
          const Image(image: AssetImage("asset/images/tadbiro_logo.png")),
          const Text(
            "Ro'yhatdan o'tish",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Iltimos emailingizni kiriting !";
                      } else if (value.length < 6 ||
                          !value.contains("@") ||
                          !value.contains(".")) {
                        return "Iltimos emailingizni to'g'ri kiriiting !";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        errorText: checkEmail ? "bunday email mavjud !" : null,
                        errorStyle: TextStyle(color: Colors.red),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Email",
                        border: OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                        errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1))),
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Iltimos parolni kiriting !";
                      } else if (value.length < 8) {
                        return "Parolni uzunligi 7 tadan uzun bolishi kerak";
                      }
                      return null;
                    },
                    obscuringCharacter: "*",
                    obscureText: obscureIsDoneP,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.red),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Parol",
                      suffixIconColor: Colors.grey,
                      suffixIcon: IconButton(
                          onPressed: () {
                            obscureIsDoneP = !obscureIsDoneP;
                            setState(() {});
                          },
                          icon: Icon(obscureIsDoneP
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash)),
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1)),
                    ),
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: _passwordConfirmController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Iltimos parolni kiriting !";
                      } else if (_passwordConfirmController.text !=
                          _passwordController.text) {
                        return "Parollar bir xil emas !";
                      }
                      return null;
                    },
                    obscuringCharacter: "*",
                    obscureText: obscureIsDoneC,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.red),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Parolni tasdiqlang",
                      suffixIconColor: Colors.grey,
                      suffixIcon: IconButton(
                          onPressed: () {
                            obscureIsDoneC = !obscureIsDoneC;
                            setState(() {});
                          },
                          icon: Icon(obscureIsDoneC
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash)),
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(60),
          GestureDetector(
            onTap: () async {
              if (_globalKey.currentState!.validate()) {
                var data = await authHtppServices.login(
                    _emailController.text, _passwordController.text);
                if (!data["check"]) {
                  print("aaa");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => UserName(
                                email: _emailController.text,
                                password: _passwordController.text,
                              )));
                } else {
                  checkEmail = true;
                  setState(() {});
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellowAccent, width: 1),
                    // color: Color.fromARGB(255, 255, 255, 159),
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    "Kirish",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          const Gap(40),
          TextButton(
              onPressed: () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const SignIn()));
              },
              child: const Text(
                "Tizimga kirish",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ))
        ],
      )),
    );
  }
}
