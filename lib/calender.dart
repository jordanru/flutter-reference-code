import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inventory/main.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(MaterialApp(
      home: Calender(),
    ));

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  bool chBstate = false;
  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events;
  TextEditingController _eventController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _events = {};
    _eventController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddListTile,
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(7, 150, 7, 0),
                child: TableCalendar(
                  events: _events,
                  calendarController: _calendarController,
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(color: Colors.orange, fontSize: 18),
                      weekdayStyle: TextStyle(color: Colors.black, fontSize: 18)),
                  calendarStyle: CalendarStyle(
                    todayColor: Colors.white,
                    todayStyle: TextStyle(color: Colors.orange),
                    selectedStyle: TextStyle(
                      color: Colors.white,
                    ),
                    selectedColor: Colors.orange,
                    weekdayStyle: TextStyle(color: Colors.black, fontSize: 16),
                    weekendStyle: TextStyle(color: Colors.orange, fontSize: 16),
                    outsideWeekendStyle:
                        TextStyle(color: Colors.orange[300], fontSize: 15),
                    outsideStyle: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    formatButtonTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    formatButtonShowsNext: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  builders: CalendarBuilders(
                      selectedDayBuilder: (context, date, events) =>
                 Container(
                   alignment: Alignment.center,
                   margin: EdgeInsets.all(4),
                   decoration: BoxDecoration(
                     color: Colors.orange,
                     borderRadius: BorderRadius.all(Radius.circular(15)),
                     boxShadow: [BoxShadow(
                       color: Colors.grey,
                       blurRadius: 1,
                       spreadRadius: 0,
                       offset: Offset(
                        0,
                        0,
                       ),
                     )
                     ]
                   ),
                   child: Text(date.day.toString())),
                    todayDayBuilder: (context, date, events) =>
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                boxShadow: [BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  spreadRadius: 0,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                )
                                ]
                            ),
                            child: Text(date.day.toString())),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 150),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          0,
                          0,
                        ),
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints.expand(height: 10),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 93),
                            child: Text(
                              "M Y F A M",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: "Tw Cen MT",
                              ),
                            ),
                          ),
                          Container(
                              width: 10,
                              height: 10,
                              margin: EdgeInsets.only(left: 55),
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.white))),
                          Container(
                            margin: EdgeInsets.only(left: 0),
                            child: FlatButton(
                              onPressed: () {},
                              padding: EdgeInsets.all(0),
                              child: Text(
                                "A L L E",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: "Tw Cen MT",
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        constraints: BoxConstraints.expand(height: 1),
                        color: Colors.white,
                      ),
                      Container(
                        constraints: BoxConstraints.expand(height: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20)),
                            child: Text(
                              "Pinnwand",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.grey[450],
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20)),
                            child: Text(
                              "Kalender",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20)),
                            child: Text(
                              "Aktivitäten",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAddListTile() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: Column(
        children: <Widget>[
              TextField(
                maxLengthEnforced: true,
                controller: _eventController,
              ),
              FlatButton(
                child: Text("SPEICHERN",
                style: TextStyle(
                  letterSpacing: 5
                ),),
                onPressed: () {
                  if (_eventController.text.isEmpty) return;
                  setState(() {
                  if (_events[_calendarController.selectedDay] != null) {
                  _events[_calendarController.selectedDay]
                      .add(_eventController.text);
                  } else {
                  _events[_calendarController.selectedDay] = [
                  _eventController.text
                  ];
                  }
                  });
                  },
              ),

        ],
    ),
            ),
          );
        }
       );
  }
}
