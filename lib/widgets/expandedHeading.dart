import 'package:flutter/material.dart';

class ExpandedHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Text(
        'Color Picker',
        style: TextStyle(
            fontFamily: 'Product Sans',
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20),
      ),
    );
  }
}
