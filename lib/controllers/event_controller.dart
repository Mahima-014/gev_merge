import 'package:gev_app/models/event_list_model.dart';
import 'package:gev_app/utilities/db_manager.dart';

class EventController {
  DbManager dbManager;

  // List to get events for the item builder.
  List<EventListModel> getEventList(int year, String month) {
    // HashMap map = HashMap<String, String>();
    //dbManager.insert("", map);

    List<EventListModel> eventList = [
      EventListModel(
          eventName: 'Govardhan Puja',
          date: '11/02/2021',
          description: 'Pooja'),
      EventListModel(
          eventName: 'Yamuna Arti', date: '11/02/2021', description: 'Pooja'),
      EventListModel(
          eventName: 'Evening Arti', date: '11/02/2021', description: 'Pooja'),
    ];
    return eventList;
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
