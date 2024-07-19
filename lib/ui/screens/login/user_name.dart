import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadbiro_ap/data/user_model.dart';
import 'package:tadbiro_ap/services/login/auth_htpp_services.dart';
import 'package:tadbiro_ap/ui/screens/home/home_screen.dart';

class UserName extends StatefulWidget {
  final String email;
  final String password;
  const UserName({super.key, required this.email, required this.password});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
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
            "Ism va Familya",
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
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Iltimos ismingizni kiriting !";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(color: Colors.red),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Ism",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1)),
                    ),
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: _surnameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Iltimos familyangizni kiriting !";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(color: Colors.red),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Familya",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(100),
          GestureDetector(
            onTap: () async {
              if (_globalKey.currentState!.validate()) {
                var data = await authHtppServices.createUser(UserModel(
                  id: "",
                  userId: "userId",
                  name: _nameController.text,
                  surname: _surnameController.text,
                  email: widget.email,
                  password: widget.password,
                ));
                if (data["check"]) {
                  final pref = await SharedPreferences.getInstance();
                  pref.setString("localId", data["localId"]);
                  pref.setBool('isLoggedIn', true);

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (ctx) => const HomeScreen()),
                    (Route<dynamic> route) => false,
                  );
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
                    "Saqlash",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
