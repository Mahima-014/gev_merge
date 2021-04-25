import 'package:flutter/material.dart';
import 'package:gev_app/controllers/login_controller.dart';
import 'package:gev_app/utilities/commons.dart';
import 'package:gev_app/utilities/constants.dart';
import 'package:gev_app/views/login.dart';

//Profile Screen.
//Screen to update user's profile.

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController dateOfBirthCon = TextEditingController();
  DateTime dateOfBirth;

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appBar('Profile'),
      bottomNavigationBar: BottomNavbar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingHomeButton(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: Common.background(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 10, right: 10, top: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        Common.buildInputDecoration(Icons.person_pin, "Name"),
                    onFieldSubmitted: (value) {
                      //Validator
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: Common.buildInputDecoration(
                        Icons.email_outlined, "Email"),
                    validator: (value) {
                      if (value.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: Common.buildInputDecoration(
                        Icons.phone, "Contact Number"),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: Common.buildInputDecoration(
                        Icons.location_on, "Address"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: TextFormField(
                    controller: dateOfBirthCon,
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      pickupDateOfBirth();
                    },
                    decoration: Common.buildInputDecoration(
                        Icons.calendar_today_sharp, "Date-Of-Birth"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: TextFormField(
                    readOnly: true,
                    decoration:
                        Common.buildInputDecoration(Icons.translate, "English"),
                    validator: null,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: ButtonTheme(
                    minWidth: 120,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {
                        _submit();
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(Constant.buttonColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              const Radius.circular(8.0),
                            ),
                            side:
                                BorderSide(color: Color(Constant.buttonColor))),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ButtonTheme(
                    minWidth: 120,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {
                        LogInController().logout();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              const Radius.circular(8.0),
                            ),
                            side:
                                BorderSide(color: Color(Constant.buttonColor))),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickupDateOfBirth() async {
    DateTime dateOfBirthLoc = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
          DateTime.now().year - 100,
        ),
        lastDate: DateTime(
          DateTime.now().year + 100,
        ));
    if (dateOfBirthLoc == null) {
      print(dateOfBirthLoc);
    } else {
      {
        setState(() {
          dateOfBirth = dateOfBirthLoc;
          dateOfBirthCon.text =
              "${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}";
        });
      }
    }
  }
}
