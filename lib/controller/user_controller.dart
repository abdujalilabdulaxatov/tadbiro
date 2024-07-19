import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadbiro_ap/services/login/auth_htpp_services.dart';

class UserController extends ChangeNotifier {
  final authHtppServices = AuthHtppServices();
  Future<Map<String, dynamic>> getUserInfo() async {
    final pref = await SharedPreferences.getInstance();
    String? localId = pref.getString("localId");
    Map<String, dynamic>? userInfo =
        await authHtppServices.getUserInfo(localId!);
    print(userInfo);
    notifyListeners();
    return userInfo;
  }
}
