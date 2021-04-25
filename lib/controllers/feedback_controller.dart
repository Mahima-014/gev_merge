import 'package:gev_app/models/feedback.dart';
import 'package:gev_app/models/feedback_list_model.dart';
import 'package:gev_app/utilities/commons.dart';
import 'package:gev_app/utilities/constants.dart';
import 'package:gev_app/utilities/db_manager.dart';
import 'package:gev_app/utilities/webservice_manager.dart';

class FeedbackController {

  // List to get the feedbacks for the item builder (home screen).
  List<FeedbackListModel> getFeedbackList() {
    List<FeedbackListModel> feedbackList = [
      FeedbackListModel(
        name: 'Raman',
        text: 'Here is the text',
        rating: 4.0,
      ),
      FeedbackListModel(
        name: 'Rohan',
        text: 'Here is the text',
        rating: 4.0,
      ),
      FeedbackListModel(
        name: 'Raman',
        text: 'Here is the text',
        rating: 4.0,
      ),
      FeedbackListModel(
        name: 'Raman',
        text: 'Here is the text',
        rating: 4.0,
      ),
    ];
    return feedbackList;
  }

  // List to get the feedbacks for the item builder (feedback screen).
  List<FeedbackListModel> getViewDetailsList() {
    List<FeedbackListModel> viewDetailsList =[

      FeedbackListModel(
          text : "Overall Experience",
          rating: 3.0
      ),
      FeedbackListModel(
          text : "Reservation Experience",
          rating: 3.0
      ),
      FeedbackListModel(
          text : "Staff Experience",
          rating:  3.0
      ),
      FeedbackListModel(
          text : "Events Organization"
          ,rating:  3.0
      ),
      FeedbackListModel(
          text : "Value For Money",
          rating:  3.0
      ),
    ];

    print("getFeedbackList() : ${viewDetailsList[0].text}");
    return viewDetailsList;
  }


  //Function for storing data in database.
  void saveDataToDB(FeedbackModel feedbackModel)
  {
    DbManager db = DbManager();
    db.createTableIfNotExists(Constant.mobile_user_feedback, Constant.queryToCreateMobileUserFeedbackTable);
    db.insert(Constant.mobile_user_feedback, feedbackModel.toJson());

  }

  //Send Feedback Data to Server by calling API
  sendDataToServer(FeedbackModel feedbackModel) async
  {
    feedbackModel.userId = 20; feedbackModel.mobileUserDetailsId = 52; feedbackModel.visitDate=Common.convertDateTimeToString(DateTime.now());
    print("sendDataToServer: ${feedbackModel.toString()}");
    WebserviceManager webserviceManager = WebserviceManager();
    Map<dynamic, dynamic> response = await webserviceManager.makePostRequestMap(Constant.SUB_URL_add_user_feedback, feedbackModel.toJson());
    print("Response: " + response.toString());
  }
}
