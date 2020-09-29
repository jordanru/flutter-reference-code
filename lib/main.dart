//import 'dart:html';
import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:inventory/ImageEintrag.dart';
import 'package:inventory/TextEintrag.dart';
import 'file:///C:/Users/Admin/AndroidStudioProjects/inventory/lib/calender.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = 'One';

  //Gruppe erstellen
  List<CheckboxItem> chBoxList = [];
  List<String> chBoxSelList = [];
  String gName = "NAME";

  Map<String, bool> values = {
    "Max Mustermann": false,
    "Marc Mustermann": false,
    "Moritz Mustermann": false,
    "Mika Mustermann": false,
    "Jörg Mustermann": false,
    "Alina Mustermann": false,
    "Marten Mustermann": false
  };

  //ColorPicker Gruppe Erstellen
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => currentColor = color);
  }

  void resetChBoxList() {

    chBoxList.add(new CheckboxItem("Max Mustermann", false));
    chBoxList.add(new CheckboxItem("Marc Mustermann", false));
    chBoxList.add(new CheckboxItem("Moritz Mustermann", false));
    chBoxList.add(new CheckboxItem("Mika Mustermann", false));
    chBoxList.add(new CheckboxItem("Alina Mustermann", false));
    chBoxList.add(new CheckboxItem("Marten Mustermann", false));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resetChBoxList();
  }

  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey[850],
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ]),
              child: Container(
                margin: EdgeInsets.only(top: 130),
                child: ListView(
                  children: ListViewRandomizer(),
                ),
              ),
            ),
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
                              onPressed: _showGroupList,
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
                            onPressed: () {},
                            color: Colors.grey[450],
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20)),
                            child: Text(
                              "Pinnwand",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                contxt,
                                MaterialPageRoute(
                                    builder: (context) => Calender()),
                              );
                            },
                            color: Colors.white,
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

  void _showGroupList() {
    BuildContext c = this.context;
    showModalBottomSheet(
        context: c,
        builder: (c) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Gruppen",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.orange,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: ListView(
                      children: returnGroupCards(),
                      shrinkWrap: true,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

//Function to start Step 1 of creating a Group
  void _showGroupS1() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return createGroupS1();
        });
  }

//Function to start Step 2 of creating a Group
  void _showGroupS2() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return createGroupS2();
        });
  }

/*----------------------------------------------------------------------------*/
/*----------------------------GROUP MANAGEMENT--------------------------------*/
/*----------------------------------------------------------------------------*/

  List<Widget> returnGroupCards() {
    List<Widget> GroupCards = [];

    GroupCards.add(OpenGroupCard("A L L E"));
    GroupCards.add(OpenGroupCard("M U S T E R M A N N ' S"));
    GroupCards.add(addGroupCard());

    return GroupCards;
  }

  int sortSelMembersinArray() {
    chBoxSelList.clear();

    for (CheckboxItem c in chBoxList) {
      if (c.state == true) {
        chBoxSelList.add(c.titel);
      } else {}
    }

    return chBoxSelList.length;
  }

  /* List<Widget> returnMemberList() {
    List<Widget> MemberList = [];

    List<String> ml = I_Creator;
    for (String M in ml) {
      MemberList.add(MemberListCard());
    }

    return MemberList;
  }*/

/*-----------------------------GROUP WIDGETS----------------------------------*/

//GROUP CARD FOR MEMBER AND OWNER
  Widget OpenGroupCard(String x) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white))),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: FlatButton(
                  child: Text(
                    x,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 24,
                      fontFamily: "Tw Cen MT",
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Container(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  width: 40,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.grey[800],
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 15, 5),
                  width: 40,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey[800],
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

//GROUP CARD FOR NON-MEMBER
  Widget ClosedGroupCard(String x) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white))),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: FlatButton(
                  child: Text(
                    x,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 24,
                      fontFamily: "Tw Cen MT",
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Container(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  width: 40,
                  child: IconButton(
                    icon: Icon(
                      Icons.lock_outline,
                      color: Colors.grey[800],
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 15, 5),
                  width: 40,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey[800],
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

//CARD TO CREATE A GROUP
  Widget addGroupCard() {
    return Container(
      height: 50,
      child: FlatButton(
        onPressed: () {
          _showGroupS1();
          resetChBoxList();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
              child: Text(
                "Neue Gruppe erstellen",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 24,
                  fontFamily: "Tw Cen MT",
                ),
              ),
            ),
            Container(),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: Icon(
                Icons.add,
                color: Colors.grey[800],
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }

  /*
  * GROUP STEPS WIDGETS
  * */

  Widget createGroupS1() {
    return Container(
      color: Color(0xFF737373),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(10),
              child: Text(
                "Gruppe erstellen",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              height: 2,
              color: Colors.orange,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 150, 0),
              child: TextFormField(
                  onChanged: (String text) {
                    gName = text;
                  },
                  decoration: InputDecoration(
                      hintText: "Gruppen Name",
                      hintStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200])),
            ),
            ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 230.0,
                  minHeight: 0.0,
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 140, 0),
                  child: ListView.builder(
                      itemCount: chBoxList.length,
                      itemBuilder: (BuildContext context, int Index) {
                        return BottomSheetCheckbox(
                            title: chBoxList[Index].titel,
                            checkboxValue: chBoxList[Index].state,
                            valueChanged: (value) {
                              setState(() {
                                chBoxList[Index].state = value;
                              });
                            });
                      }),
                )),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "WEITER",
                  style: TextStyle(
                      letterSpacing: 5, color: Colors.grey[800], fontSize: 16),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _showGroupS2();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createGroupS2() {
    return Container(
        color: Color(0xFF737373),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(10),
              child: Text(
                "Gruppe erstellen",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              height: 2,
              color: Colors.orange,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(15,30, 0, 0),
                        child: Row(
                          children: <Widget>[
                            //Gruppenname
                            Container(

                              child: Text(
                                gName.toUpperCase(),
                                style: TextStyle(
                                  letterSpacing: 5,
                                  fontSize: 32,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //Farb Punkt
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerRight,
                              child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: currentColor,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                            )
                          ],
                        ),
                      ),
                      //Member Liste
                      Container(
                        margin: EdgeInsets.fromLTRB(15,5, 0, 0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 100.0,
                            minHeight: 0.0,
                            maxWidth: 150,
                            minWidth: 0.0,
                          ),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: sortSelMembersinArray(),
                                itemBuilder: (BuildContext context, int Index) {
                                  sortSelMembersinArray();
                                  return (Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            child: Image.network(
                                              "https://cdn.pixabay.com/photo/2012/04/26/19/43/profile-42914_960_720.png",
                                              height: 20.0,
                                              width: 20.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                          child: Text(
                                            chBoxSelList[Index],
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(40, 50, 15, 0),
                    child: BlockPicker(
                      pickerColor: pickerColor,
                      onColorChanged: changeColor
                      ),
                    ),
                  //ColorPicker
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "E R S T E L L E N",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      letterSpacing: 5
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ]),
        ));
  }

  Widget chBoxItem(BuildContext c, int Index) {
    return CheckboxListTile(
      title: Text(chBoxList[Index].titel),
      value: chBoxList[Index].state,
      onChanged: (bool value) {
        setState(() {
          chBoxList[Index].state = value;
        });
      },
    );
  }

  Widget MemberListCard(String member, bool _isChecked) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2012/04/26/19/43/profile-42914_960_720.png",
                    height: 10.0,
                    width: 10.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
                child: Text(
                  member,
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            child: Checkbox(
              value: _isChecked,
              onChanged: (bool v) {
                setState(() {
                  _isChecked = v;
                });
              },
            ),
          )
        ],
      ),
    );
  }

/*----------------------------------------------------------------------------*/
/*--------------------------------LISTVIEW------------------------------------*/
/*----------------------------------------------------------------------------*/

  List<Widget> ListViewRandomizer() {
    List<Widget> mixedCards = [];

    for (int i = 0; i < 15; i++) {
      Random r = new Random();
      int x = r.nextInt(3);

      if (x == 2) {
        List<TextEintrag> te = findE();
        mixedCards.add(getTECard(te[1]));
      } else {
        List<ImageEintrag> ie = findI();
        mixedCards.add(getImageCard(ie[1]));
      }
    }

    return mixedCards;
  }

  //RANDOM CONTENT
  List<String> Title = [
    "Hanau und die Rolle der AfD",
    "Neue Esszimmerlampe!",
    "Brauche eure Hilfe!"
  ];
  List<String> Content = [
    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
    "Aliquam auctor fermentum sapien vitae ultricies. Cras nulla leo, imperdiet facilisis eros a, sodales suscipit nunc. Nunc at velit tempor, viverra ipsum a, dictum purus. Praesent nec augue elementum, consectetur purus at, gravida odio. Ut consectetur, enim eu eleifend eleifend, lectus orci tincidunt leo, feugiat interdum magna augue consectetur est. Nam vitae libero bibendum, cursus mi nec, pulvinar erat. Proin lorem dui, mattis id feugiat vitae, blandit sed libero. Integer placerat risus quis arcu fringilla, ac blandit orci tincidunt. Praesent facilisis turpis sit amet sapien placerat consequat. Mauris eget diam cursus, pulvinar mauris in, blandit neque. Cras molestie mollis velit ultrices porttitor. Praesent eget orci felis. Cras vitae risus eu neque lacinia tincidunt. Proin nec felis iaculis, eleifend est id, vehicula nulla.",
    "Aliquam leo metus, elementum sit amet turpis ornare, pretium finibus sem. Aliquam semper pellentesque ante a ornare. Suspendisse pulvinar dictum felis, tincidunt maximus magna vulputate ullamcorper. Pellentesque vitae volutpat urna, posuere laoreet enim. Fusce eget lacus egestas, vulputate risus sit amet, posuere sapien. Etiam suscipit pharetra felis, quis varius est mattis sed. Suspendisse vel massa viverra, semper eros vitae, tempor enim. Donec vestibulum, ex a tempor ornare, lacus orci tincidunt orci, eu aliquam ex felis in arcu. Quisque commodo ultrices tempus. Vivamus non blandit leo."
  ];
  List<String> Date = ["27.02.2020", "20.02.2020", "15.02.2020"];
  List<String> Creator = ["Max Mustermann", "Marc Mustermann", "Moritz Mustermann"];

  List<TextEintrag> findE() {
    List<TextEintrag> TE = [];

    for (int i = 0; i < 10; i++) {
      Random random = new Random();
      TE.add(new TextEintrag(
          Title[random.nextInt(3)],
          Content[random.nextInt(3)],
          Date[random.nextInt(3)],
          Creator[random.nextInt(3)]));
    }

    return TE;
  }

  List<Widget> getRecentTE() {
    List<Widget> recentTECards = [];
    List<TextEintrag> te = findE();
    for (TextEintrag TE in te) {
      recentTECards.add(getTECard(TE));
    }
    return recentTECards;
  }

  Widget getTECard(TextEintrag te) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2012/04/26/19/43/profile-42914_960_720.png",
                    height: 30.0,
                    width: 30.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
                child: Text(
                  te.creator,
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            height: 5,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(10, 2, 0, 0),
            child: Text(
              te.titel,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(10),
            child: Text(
              te.beitrag,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.fromLTRB(0, 0, 5, 3),
            child: Text(
              te.datum,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            height: 5,
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          Container(
            height: 5,
          ),
        ],
      ),
    );
  }

  List<String> I_title = [
    "Weihnachten 2019",
    "Weihnachten 2020",
    "Unsere Trip in die Alpen",
    "Mallorca Urlaub",
    "Hab meine Klasurergebnisse",
    "Möchte jemand meine alten Schuhe haben?",
    "Familienessen im Da Gino",
  ];
  List<String> I_content = [
    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
    "Aliquam auctor fermentum sapien vitae ultricies. Cras nulla leo, imperdiet facilisis eros a, sodales suscipit nunc.",
    "Aliquam leo metus, elementum sit amet turpis ornare, pretium finibus sem. Aliquam semper pellentesque ante a ornare. Suspendisse pulvinar dictum felis, tincidunt maximus magna vulputate ullamcorper."
  ];
  List<String> I_Date = [
    "27.02.2020",
    "20.02.2020",
    "15.02.2020",
    "23.02.2020",
    "14.02.2020",
    "09.02.2020",
    "30.02.2020"
  ];
  List<String> I_Images = [
    'lib/assets/pic1.jpeg',
    'lib/assets/pic2.jpeg',
    'lib/assets/pic3.jpeg',
    'lib/assets/pic4.jpeg'
  ];
  List<String> I_Creator = [
    "Max Mustermann",
    "Marc Mustermann",
    "Moritz Mustermann",
    "Mika Mustermann",
    "Jörg Mustermann",
    "Alina Mustermann",
    "Marten Mustermann"
  ];

  List<ImageEintrag> findI() {
    List<ImageEintrag> IE = [];

    for (int i = 0; i < 10; i++) {
      Random random = new Random();
      List<String> ie = [
        I_Images[random.nextInt(4)],
        I_Images[random.nextInt(4)]
      ];
      IE.add(new ImageEintrag(
          I_title[random.nextInt(7)],
          I_content[random.nextInt(3)],
          ie,
          I_Date[random.nextInt(7)],
          I_Creator[random.nextInt(7)]));
    }

    return IE;
  }

  List<Widget> getRecentIE() {
    List<Widget> recentIECards = [];
    List<ImageEintrag> ie = findI();
    for (ImageEintrag IE in ie) {
      recentIECards.add(getImageCard(IE));
    }
    return recentIECards;
  }

  Widget getImageCard(ImageEintrag ie) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2012/04/26/19/43/profile-42914_960_720.png",
                    height: 30.0,
                    width: 30.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
                child: Text(
                  ie.creater,
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            height: 5,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(10, 2, 0, 0),
            child: Text(
              ie.titel,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(10),
            child: Text(
              ie.bemerkung,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getImageCards(),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.fromLTRB(0, 0, 5, 3),
            child: Text(
              ie.datum,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            height: 5,
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          Container(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget ImageCard(String image) {
    return Row(
      children: <Widget>[
        Container(
          width: 5,
        ),
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          width: 5,
        ),
      ],
    );
  }

  List<String> findImages() {
    List<String> Image = [];

    for (int i = 0; i < 10; i++) {
      Random random = new Random();
      Image.add(I_Images[random.nextInt(4)]);
    }

    return Image;
  }

  List<Widget> getImageCards() {
    List<Widget> recentImageCards = [];
    List<String> images = findImages();
    for (String IM in images) {
      recentImageCards.add(ImageCard(IM));
    }
    return recentImageCards;
  }
}

class CheckboxItem {
  String titel;
  //List<AssetImage> image;
  bool state;

  CheckboxItem(this.titel, this.state);
}

/*-----------------------------HELPER CLASSES----------------------------------*/

class BottomSheetCheckbox extends StatefulWidget {
  BottomSheetCheckbox(
      {@required this.checkboxValue,
      @required this.valueChanged,
      @required this.title});

  final bool checkboxValue;
  final ValueChanged valueChanged;
  final String title;

  @override
  _BottomSheetCheckbox createState() => _BottomSheetCheckbox();
}

class _BottomSheetCheckbox extends State<BottomSheetCheckbox> {
  bool _checkboxValue;

  @override
  void initState() {
    _checkboxValue = widget.checkboxValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CheckboxListTile(
          title: Text(widget.title),
          value: _checkboxValue,
          onChanged: (bool value) {
            setState(() {
              _checkboxValue = value;
              widget.valueChanged(value);
            });
          }),
    );
  }
}


class _ColorContainer extends StatefulWidget {

  _ColorContainer(
      {@required this.changedColor});
  
  final Color changedColor;


  @override
  __ColorContainerState createState() => __ColorContainerState();
}

class __ColorContainerState extends State<_ColorContainer> {
  
  Color _changedColor;
  
  
  @override
  void initState() {
    _changedColor = widget.changedColor; 
    super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerRight,
      child: Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: _changedColor,
              borderRadius:
              BorderRadius.all(Radius.circular(20)))),
      
    );
  }
}

