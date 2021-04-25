import 'dart:convert';

import 'package:gev_app/models/user.dart';
import 'package:gev_app/utilities/webservice_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController {
  // Preferences preferences;

  // Function for user registration.
  void register(User user) async {
    WebserviceManager wsm = new WebserviceManager();
    Map<dynamic, dynamic> response =
        await wsm.makePostRequest('add-user-info', json.encode(user.toJson()));
    print("Response" + response.toString());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', user.userName);
    prefs.setString('phoneNo', user.userPhone.toString());
    prefs.setString('email', user.userEmail);

    print(
        "You are registered. DETAILS : username : ${user.userName}, phoneNo : ${user.userPhone}, email : ${user.userEmail}");
  }
}
