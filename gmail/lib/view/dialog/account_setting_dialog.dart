import 'package:flutter/material.dart';
import 'package:gmail/view/widgets/circle_avatar_view.dart';

class AccountSettingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(left: 00, top: 10, right: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {},
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Google"),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: CircleAvatarView(char: "L", size: 40),
                onTap: () => {},
                title: Text(
                  "Le huu thanh",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                subtitle: Text(
                  "thanhlh.ktmt@gmal.com",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                trailing: Text("12",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
            ),
            Container(
              child: OutlinedButton(
                child: Text("google account"),
                onPressed: () {},
              ),
            ),
            Divider(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: CircleAvatarView(char: "L", size: 40),
                onTap: () => {},
                title: Text(
                  "Le huu thanh",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                subtitle: Text(
                  "thanh.lh91.bk@gmal.com",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                trailing: Text("2",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: CircleAvatarView(char: "L", size: 40),
                onTap: () => {},
                title: Text(
                  "Le thanh",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                subtitle: Text(
                  "thanh.lh.1991@gmal.com",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                trailing: Text("99+",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.account_box_outlined),
                  ),
                ),
                onTap: () => {},
                title: Text(
                  "Add another account",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  child: Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.mark_as_unread)),
                ),
                onTap: () => {},
                title: Text(
                  "Manage all accounts on this device",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "privacy",
                      style: TextStyle(color: Colors.black87, fontSize: 15),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "service",
                      style: TextStyle(color: Colors.black87, fontSize: 15),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
