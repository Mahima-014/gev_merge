import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gev_app/controllers/usertype_controller.dart';
import 'package:gev_app/models/user.dart';
import 'package:gev_app/models/mobile_user_details.dart';
import 'package:gev_app/utilities/local_notify_manager.dart';
import 'package:gev_app/utilities/preferences.dart';
import 'package:gev_app/utilities/webservice_manager.dart';
import 'package:gev_app/views/feedback_screen.dart';

class CheckInController {
  BuildContext context;
  Preferences preferences = Preferences();

  CheckInController({this.context});

  //To save user and mobile details in preference.
  Future<void> saveUserAndMobileUserDetailsInPreferences(
      String phone, MobileUserDetails mobileUserDetails) async {
    print(preferences.getPreferences("id"));
    print(preferences.getPreferences("phoneNo"));
    print(mobileUserDetails.checkInDate);
    print(mobileUserDetails.checkOutDate);
    User user =
        User.fromJson(jsonDecode(preferences.getPreferences('user_info')));
    print('name of user' + user.userName);

    var queryparams = {
      'user_id': preferences.getPreferences("id"),
      'mobile': phone,
      'check_in_date': mobileUserDetails.checkInDate,
      'check_out_date': mobileUserDetails.checkOutDate
    };
    print(queryparams);
    MobileUserDetails checkinDetail; //= fetchLocationList(queryparams);
    WebserviceManager wsm = new WebserviceManager();
    Map<dynamic, dynamic> response =
        await wsm.makePostRequestMap('fetch-check-in-information', queryparams);
    checkinDetail = MobileUserDetails.fromJson(response["check_in_info"]);
    print('checkinDetail controller: ' + checkinDetail.visitType.toString());
    print('check fetch : ' + checkinDetail.checkInCode.toString());
    preferences.setPreferences('mobile_user_id', checkinDetail.id.toString());
    preferences.setPreferences(
        'check_in_code', checkinDetail.checkInCode.toString());
    preferences.setPreferences(
        'check_in_date', checkinDetail.checkInDate.toString());
    preferences.setPreferences(
        'check_out_date', checkinDetail.checkOutDate.toString());
    preferences.setPreferences(
        'accommodation_type', checkinDetail.visitType.toString());
    UserType().setcheckInPref();

    // String userJson = jsonEncode(user.toJson());
    // String mobileUserDetailsJson = jsonEncode(mobileUserDetails.toJson());
    // preferences.setPreferences(Preferences.userKey, userJson);

    // print(preferences.getPreferences(Preferences.userKey));
    // preferences.setPreferences(
    //     Preferences.mobileUserDetailsKey, mobileUserDetailsJson);
    // print(preferences.getPreferences(Preferences.mobileUserDetailsKey));
  }

  // To get the user model from preferences.
  User getUserModelFromPreferences() {
    String userJson = preferences.getPreferences(Preferences.userKey);
    Map userMap = jsonDecode(userJson);
    var userModel = User.fromJson(userMap);

    return userModel;
  }

  // To get mobile user details model from preferences.
  MobileUserDetails getMobileUserDetailsModelFromPreferences() {
    String mobileUserDetailsJson =
        preferences.getPreferences(Preferences.mobileUserDetailsKey);
    Map mobileUserDetailsMap = jsonDecode(mobileUserDetailsJson);
    var mobileUserDetailsModel =
        MobileUserDetails.fromJson(mobileUserDetailsMap);

    return mobileUserDetailsModel;
  }

  //Controller for feedback notification.

  // To generate feedback notifications.
  feedbackNotification(DateTime checkOutDate) async {
    LocalNotifyManager.localNotifyManager = LocalNotifyManager.init();
    LocalNotifyManager.localNotifyManager
        .setOnNotificationReceive(onNotificationReceive);
    LocalNotifyManager.localNotifyManager
        .setOnNotificationClick(onNotificationClick);
    await LocalNotifyManager.localNotifyManager.scheduleNotification(
        checkOutDate, 101, 'Feedback', 'Please give us feedback', 'Feedback');
  }

  // Handles what to do on receiving notifications.
  onNotificationReceive(RecieveNotification notification) {
    print('Notification Recieved: ${notification.id}');
  }

  // Handles what to do when notification clicked.
  onNotificationClick(String payload) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FeedbackScreen();
    }));
  }
}
