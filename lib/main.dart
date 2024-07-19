import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadbiro_ap/controller/event_controller.dart';
import 'package:tadbiro_ap/controller/user_controller.dart';
import 'package:tadbiro_ap/services/events/event_http_services.dart';
import 'package:tadbiro_ap/services/login/auth_htpp_services.dart';
import 'package:tadbiro_ap/ui/screens/home/home_screen.dart';
import 'package:tadbiro_ap/ui/screens/home/settings_page.dart';
import 'package:tadbiro_ap/ui/screens/login/splash_screen.dart';

void main(List<String> args) {
  runApp(Tadbiro());
}

class Tadbiro extends StatelessWidget {
  const Tadbiro({super.key});

  Future<bool> _checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => AuthHtppServices()),
          ChangeNotifierProvider(create: (ctx) => EventHttpServices()),
          ChangeNotifierProvider(create: (ctx) => EventController()),
          ChangeNotifierProvider(create: (ctx) => UserController()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark),
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          home: FutureBuilder<bool>(
            future: _checkIfLoggedIn(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                if (snapshot.data == true) {
                  return const HomeScreen();
                } else {
                  return const SplashScreen();
                }
              }
            },
          ),
        ));
  }
}
