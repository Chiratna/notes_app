import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/screens/archieveScreen.dart';
import 'package:notes_app/screens/home1.dart';
import 'package:notes_app/screens/importantScreen.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer(this.mode);
  final Modes mode;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Color(0xffF28B83),
            padding: EdgeInsets.only(left: 16, top: 32),
            alignment: Alignment.centerLeft,
            child: Text(
              'Notes',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (mode != Modes.All) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => HomeScreen1()),
                    (Route<dynamic> route) => false);
              }
            },
            child: Container(
              height: 80,
              color: mode == Modes.All ? Colors.yellow[300] : Colors.white,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Icon(FontAwesomeIcons.stickyNote),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'All',
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (mode != Modes.Important) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ImportantScreen()));
              } else {
                FocusScope.of(context).requestFocus(new FocusNode());
              }
            },
            child: Container(
              height: 80,
              color:
                  mode == Modes.Important ? Colors.yellow[300] : Colors.white,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Icon(FontAwesomeIcons.star),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Important',
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (mode != Modes.Archive) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ArchiveScreen()));
              } else {
                FocusScope.of(context).requestFocus(new FocusNode());
              }
            },
            child: Container(
              height: 80,
              color: mode == Modes.Archive ? Colors.yellow[300] : Colors.white,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Icon(FontAwesomeIcons.archive),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Archived',
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
