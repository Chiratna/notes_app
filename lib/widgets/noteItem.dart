import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/helper/notedb.dart';

import '../constants.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors[note.colorIndex],
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Text(
                    note.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(bottom: 16),
                  child: note.isImportant
                      ? Icon(
                          FontAwesomeIcons.solidStar,
                          size: 18,
                        )
                      : Icon(
                          FontAwesomeIcons.star,
                          size: 18,
                        ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              note.body,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Product Sans',
                fontSize: 20,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
              top: 16,
            ),
            child: Text(
              DateFormat.MMMd().format(note.creationDate),
              style: TextStyle(
                color: Colors.black38,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
