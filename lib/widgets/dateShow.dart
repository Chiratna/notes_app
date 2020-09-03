import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDisplay extends StatelessWidget {
  DateDisplay(this.dateTime);
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16,
      ),
      alignment: Alignment.center,
      child: Text(
        DateFormat.MMMd().add_jm().format(dateTime),
        style: TextStyle(
          fontFamily: 'Product Sans',
          fontSize: 20,
        ),
      ),
    );
  }
}
