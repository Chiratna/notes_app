import 'package:flutter/material.dart';

class SaveIcon extends StatelessWidget {
  SaveIcon({this.isChanged, this.pressHandler});

  final Function pressHandler;
  final isChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      width: isChanged ? 110 : 0,
      margin: EdgeInsets.only(left: 8),
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(100),
          ),
        ),
        color: Colors.black,
        onPressed: pressHandler,
        textColor: Colors.white,
        label: Text(
          'SAVE',
          style: TextStyle(
            fontFamily: 'Product Sans',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
