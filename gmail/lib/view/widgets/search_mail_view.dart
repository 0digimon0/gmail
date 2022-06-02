import 'package:flutter/material.dart';
import 'package:gmail/view/widgets/circle_avatar_view.dart';

class SearchMailView extends StatelessWidget {
  VoidCallback openDrawerMenu;
  final void Function(BuildContext) showSettingDialog;

  SearchMailView(this.openDrawerMenu, this.showSettingDialog);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.green,
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ]),
      height: 50,
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  openDrawerMenu();
                },
                child: Icon(Icons.menu),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Search in mail",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          InkWell(
            child: CircleAvatarView(
              size: 30,
              color: Colors.blue,
              char: "A",
            ),
            onTap: () {
              showSettingDialog(context);
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
