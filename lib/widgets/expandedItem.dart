import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class ExpandedItemContainer extends StatelessWidget {
  ExpandedItemContainer({
    this.curIndex,
    this.index,
  });
  final int curIndex;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 3),
      ),
      child: CircleAvatar(
        backgroundColor: colors[index],
        radius: 20,
        child: curIndex == index
            ? Icon(
                FontAwesomeIcons.check,
                color: Colors.black,
              )
            : null,
      ),
    );
  }
}
