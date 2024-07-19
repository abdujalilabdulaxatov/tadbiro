import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadbiro_ap/services/login/auth_htpp_services.dart';
import 'package:tadbiro_ap/ui/screens/home/home_screen.dart';
import 'package:tadbiro_ap/ui/screens/login/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscureIsDoneP = true;

  bool obscureIsDone = true;
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  bool checkEmail = false;
  bool checkPassword = false;
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
            "Tizimga kirish",
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
                if (data["check"]) {
                  final pref = await SharedPreferences.getInstance();
                  pref.setString("localId", data["localId"]);
                  pref.setBool('isLoggedIn', true);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (ctx) => const HomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                } else {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text(data["error"].toString()),
                        );
                      });
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellowAccent, width: 1),
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
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const SignUp()));
              },
              child: const Text(
                "Ro'yhatdan o'tish",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ))
        ],
      )),
    );
  }
}
