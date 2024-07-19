import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadbiro_ap/controller/user_controller.dart';
import 'package:tadbiro_ap/ui/screens/home/my_tadbir/my_tadbir.dart';
import 'package:tadbiro_ap/ui/screens/home/home_screen.dart';
import 'package:tadbiro_ap/ui/screens/home/settings_page.dart';
import 'package:tadbiro_ap/ui/screens/login/sign_in.dart';

class TadbiroDrawer extends StatefulWidget {
  const TadbiroDrawer({super.key});

  @override
  State<TadbiroDrawer> createState() => _TadbiroDrawerState();
}

class _TadbiroDrawerState extends State<TadbiroDrawer> {
  String name = "";
  String surname = "";
  String email = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    final userController = UserController();
    Map<String, dynamic> data = await userController.getUserInfo();
    print(data["user"]);
    name = data["user"]["name"];
    surname = data["user"]["surName"];
    email = data["user"]["email"];
    print("aaaa");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 39, 39, 39),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage("asset/images/tadbiro_logo.png"),
                    radius: 30,
                  ),
                  Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Text(
                          "$name $surname",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: Text(
                          email,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            GestureDetector(
              child: const ListTile(
                title: Text(
                  "Kunduzgi rejim",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.light_mode,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const MyTadbir()));
              },
              child: const ListTile(
                title: Text(
                  "Tadbirlarim",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.text_snippet_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const HomeScreen()));
              },
              child: const ListTile(
                title: Text(
                  "Bosh sahifa",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const SettingsPage()));
              },
              child: const ListTile(
                title: Text(
                  "Sozlamar",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              child: const ListTile(
                title: Text(
                  "Til",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', false);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const SignIn()));
              },
              child: const ListTile(
                title: Text(
                  "Chiqish",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
