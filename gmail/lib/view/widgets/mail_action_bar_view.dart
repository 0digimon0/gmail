import 'package:flutter/material.dart';

class ControlMailAppBar extends StatelessWidget {
  int mailSelected = 1;

  ControlMailAppBar({Key key, this.mailSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.green,
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ]),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
          Text(
            "$mailSelected",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Expanded(child: Container()),
          IconButton(
              icon: Icon(
                Icons.archive_outlined,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.mark_email_read_outlined,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.menu_sharp,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
