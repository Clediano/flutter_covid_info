import 'package:flutter/material.dart';
import 'package:flutter_covid_info/constant.dart';

class Counter extends StatelessWidget {
  final Color color;
  final int number;
  final String title;
  const Counter({
    Key key,
    this.color = Colors.grey,
    this.number = 0,
    this.title = "Title",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: color, width: 2),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 40,
            color: color,
          ),
        ),
        Text(title, style: kSubTextStyle)
      ],
    );
  }
}