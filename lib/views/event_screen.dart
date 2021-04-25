import 'package:flutter/material.dart';
import 'package:gev_app/models/event_list_model.dart';
import 'package:gev_app/utilities/commons.dart';
import 'package:gev_app/controllers/event_controller.dart';

import '../utilities/constants.dart';

// Event Screen to get the details of each and every event in  GEV.
class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  EventController eventController = EventController();
  List<EventListModel> eventList;
  int selectedYear;
  String selectedMonth;

  @override
  void initState() {
    super.initState();
    eventList = eventController.getEventList(selectedYear, selectedMonth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appBar('Events'),
      bottomNavigationBar: BottomNavbar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingHomeButton(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 50, top: 30),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: DropdownButton<int>(
                        value: selectedYear,
                        hint: Text(
                          "Year",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 1.5),
                        ),
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey, height: 1.3),
                        icon: Icon(
                          Icons.arrow_drop_down_circle_rounded,
                          color: Colors.black,
                        ),
                        underline: Container(
                          height: 2,
                        ),
                        items: Common.getYearList().map((int value) {
                          return new DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              value.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedYear = value;
                          });
                        },
                      ),
                    ),

                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: DropdownButton<String>(
                        value: selectedMonth,
                        hint: Text(
                          "Month",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 1.5),
                        ),
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey, height: 1.3),
                        icon: Icon(
                          Icons.arrow_drop_down_circle_rounded,
                          color: Colors.black,
                        ),
                        underline: Container(
                          height: 2,
                        ),
                        items: Common.getMonthList().map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMonth = value;
                          });
                        },
                      ),
                    ),
                    // SizedBox.fromSize(
                    //   size: Size(56, 56), // button width and height
                    //   child: ClipOval(
                    //     child: Material(
                    //       color: Colors.white, // button color
                    //       child: InkWell(
                    //         onTap: () {}, // button pressed
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: <Widget>[
                    //             Icon(Icons.search), // icon
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: eventController
                            .getEventList(selectedYear, selectedMonth)
                            .length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 10, left: 10),
                            child: InkWell(
                              onTap: () {
                                showAlertBox(context, index);
                              },
                              child: Container(
                                height: 55,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(Constant.starColor),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 15, bottom: 15),
                                        child: Column(
                                          children: [
                                            Text(
                                              '${eventList[index].eventName}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, top: 15, bottom: 15),
                                        child: Column(
                                          children: [
                                            Text(
                                              '${eventList[index].date}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AlertDialog showAlertBox(BuildContext context, int index) {
    var alertBox = AlertDialog(
      title: Text(
        'Name : ${eventList[index].eventName}',
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Time: ${eventList[index].date}'),
            SizedBox(
              height: 2,
            ),
            Text('Description: ${eventList[index].description}'),
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (buildContext) {
          return alertBox;
        });
  }
}
