import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadbiro_ap/services/login/auth_htpp_services.dart';
import 'package:tadbiro_ap/ui/screens/home/home_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authHtppServices = Provider.of<AuthHtppServices>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              // color: Colors.white,
              size: 30,
            )),
        backgroundColor: Colors.black,
        title: const Text(
          "Bosh sahifa",
        ),
      ),
      body: Column(
        children: [
          Image(image: AssetImage("asset/images/tadbiro_logo.png")),
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
                final pref = await SharedPreferences.getInstance();

                // authHtppServices.changeUserInfo(
                //     pref.getString("localId").toString(),
                //     _nameController.text,
                //     _surnameController.text);
                Navigator.pop(context);
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
      ),
    );
  }
}
