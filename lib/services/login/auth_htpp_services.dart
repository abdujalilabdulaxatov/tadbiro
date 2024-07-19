import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tadbiro_ap/data/user_model.dart';

class AuthHtppServices extends ChangeNotifier {
  Future<Map<String, dynamic>> createUser(UserModel user) async {
    Uri url_user_auth = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDkAjVxpldmirGAh0jsF9N8W9ZdSWGnD3A");
    Uri url_data = Uri.parse(
        "https://tadbiro-2eeb6-default-rtdb.firebaseio.com/users.json");
    var response_user_auth = await http.post(
      url_user_auth,
      body: jsonEncode(
        {
          "email": user.email,
          "password": user.password,
          "returnSecureToken": true,
        },
      ),
    );
    var user_data_auth = jsonDecode(response_user_auth.body);
    var response_user = await http.post(
      url_data,
      body: jsonEncode(
        {
          "user": {
            "user_id": user_data_auth["localId"],
            "id": user_data_auth["name"],
            "name": user.name,
            "surName": user.surname,
            "email": user.email,
            "password": user.password,
          }
        },
      ),
    );
    var data = jsonDecode(response_user.body);
    notifyListeners();
    return {
      "check": true,
      "id": data["name"],
      "localId": user_data_auth["localId"]
    };
  }

  Future<Map<String, dynamic>> getUserInfo(String localID) async {
    Uri url = Uri.parse(
        "https://tadbiro-2eeb6-default-rtdb.firebaseio.com/users.json");

    var response = await http.get(url);

    var data = jsonDecode(response.body);
    Map<String, dynamic>? userInfo;
    if (data != null) {
      data.forEach((key, value) {
        if (value != null && value['user']["user_id"] == localID) {
          userInfo = value;
        }
      });
    }

    if (userInfo != null) {
      return userInfo!;
    } else {
      throw Exception("User not found");
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDkAjVxpldmirGAh0jsF9N8W9ZdSWGnD3A");
    var response = await http.post(url,
        body: jsonEncode({
          "email": email,
          "password": password,
          "retrunSecureToken": true,
        }));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return {"check": true, "localId": data["localId"]};
    } else {
      return {"error": data["error"]["message"], "check": false};
    }
  }

  Future<void> changeUserInfo(
      String userId, String name, String surname) async {
    String id = "";
    Uri url = Uri.parse(
        "https://tadbiro-2eeb6-default-rtdb.firebaseio.com/users.json");
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      data.forEach((key, value) async {
        if (value["user"]["user_id"] == userId) {
          id = key;
          print("$id      id");
          Uri url2 = Uri.parse(
              "https://tadbiro-2eeb6-default-rtdb.firebaseio.com/users/$id/user/.json");
          await http.patch(url,
              body: jsonEncode({
                "name": name,
                "surName": surname,
              }));
        }
      });
    }
  }
}
