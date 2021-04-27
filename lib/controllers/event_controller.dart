import 'package:flutter/material.dart';
import 'package:gev_app/models/event_list_model.dart';
import 'package:gev_app/utilities/commons.dart';
import 'package:gev_app/utilities/db_manager.dart';
import 'package:gev_app/utilities/webservice_manager.dart';

class EventController {
  DbManager dbManager;

  // List to get the feedbacks for the item builder (home screen).
  Future<List<EventListModel>> fetchEventList() async {
    List<EventListModel> eventList;
    WebserviceManager wsm = new WebserviceManager();
    Map<dynamic, dynamic> response = await wsm.makeGetRequest('fetch-events');
    print('response' + response.toString());
    eventList = List<EventListModel>.from(
        response['events'].map((json) => EventListModel.fromJson(json)));
    // print('feedbackList list controller: ' + eventList[1].name.toString());
    return eventList;
  }


  Future<List<EventListModel>> updateEventList(int year, String month, String filter) async
  {

    // DateTime date;
    // // if(year==null && month ==null )
    // //   {
    // //     date = DateTime.parse('${DateTime.now().year}-01-1');
    // //   }
    // // else if(year==null)
    // //   {
    // //     date = DateTime.parse('${DateTime.now().year}-$month-1');
    // //   }
    // // else if(month==null)
    // //   {
    // //     date = DateTime.parse('$year-${DateTime.now().month}-1');
    // //   }
    // // else {
    // //   date = DateTime.parse('$year-$month-1');
    // // }
    List <EventListModel> list = await fetchEventList();
    if(year!=null && month!=null && filter!=null)
      {
        list.removeWhere((item) =>
        Common
            .convertStringToDateTime(item.eventDate)
            .year != year && Common
            .convertStringToDateTime(item.eventDate)
            .month != month && item.eventCategory != filter);
      }
    return list;

  }
  // List to get events for the item builder.
  List<EventListModel> getEventList(int year, String month) {
    // HashMap map = HashMap<String, String>();
    //dbManager.insert("", map);

    // List<EventListModel> eventList = [
    //   EventListModel(
    //       eventName: 'Govardhan Puja',
    //       date: '11/02/2021',
    //       description: 'Pooja'),
    //   EventListModel(
    //       eventName: 'Yamuna Arti', date: '11/02/2021', description: 'Pooja'),
    //   EventListModel(
    //       eventName: 'Evening Arti', date: '11/02/2021', description: 'Pooja'),
    // ];
    // return eventList;
  }

  // Dummy code for generating notification.
  void setNotifications() {
    // LocalNotifyManager.localNotifyManager = LocalNotifyManager.init();
    // LocalNotifyManager.localNotifyManager
    //     .setOnNotificationReceive(onNotificationReceive);
    // LocalNotifyManager.localNotifyManager
    //     .setOnNotificationClick(onNotificationClick);

    // await LocalNotifyManager.localNotifyManager.showNotification();
    //await LocalNotifyManager.localNotifyManager.scheduleNotification();
    //await LocalNotifyManager.localNotifyManager.showDailyAtTimeNotification();
    //await LocalNotifyManager.localNotifyManager.showWeeklyAtDayTimeNotification();

    // onNotificationReceive(RecieveNotification notification) {
    //   print('Notification Recieved: ${notification.id}');
    // }
    //
    // onNotificationClick(String payload) {
    //   print('Payload $payload');
    //   Navigator.push(context, MaterialPageRoute(builder: (context) {
    //     return ScreenSecond(payload: payload);
    //   }));
    // }
  }
}
