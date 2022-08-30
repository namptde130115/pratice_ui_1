import 'package:flutter/material.dart';
import 'package:pratice_ui_1/constant.dart';

class Writing extends StatelessWidget {
  const Writing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('asdasdasd',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
      Text('asdasdasd',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: primaryClolor)),
      Text('asdasdasd',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
    ]);
  }
}
