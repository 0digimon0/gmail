import 'package:flutter/material.dart';

class MeetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          "Meeting",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.approval,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {}, child: Text("New meeting")),
              ),
              SizedBox(width: 15),
              Expanded(
                child: OutlinedButton(
                    onPressed: () {}, child: Text("Join by code")),
              ),
              SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}
