import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComposeMailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ComposeMailPageState();
}

class ComposeMailPageState extends State<ComposeMailPage> {
  final TextEditingController _controller = TextEditingController();
  bool isOpenCC = false;
  int sendToMailIndex = 0;

  final List<String> mails = [
    "thanhlh.ktmt@gmail.com",
    "thanh.lh.1991@gmail.com",
    "thanhbk.91@gmail.com"
  ];

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      // start filter something here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Compose mail",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.attach_file_rounded,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send_outlined,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "from",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: () {
                        debugPrint("onclick change menu");
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.centerLeft,
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(mails[sendToMailIndex],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18)),
                            ),
                            IconButton(
                              icon: Icon(Icons.expand_circle_down_outlined),
                              onPressed: _showMailSelection,
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "To",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                                decoration: InputDecoration(
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              border: InputBorder.none,
                            )),
                          ),
                          Visibility(
                              visible: !isOpenCC,
                              child: IconButton(
                                icon: Icon(Icons.expand_circle_down_outlined),
                                onPressed: (() {
                                  setState(() {
                                    isOpenCC = !isOpenCC;
                                  });
                                }),
                              ))
                        ],
                      ),
                    ))
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Visibility(
              visible: isOpenCC,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "CC",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )),
                Expanded(
                  flex: 5,
                  child: TextField(
                      decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                    border: InputBorder.none,
                  )),
                )
              ]),
            ),
            Visibility(
              visible: isOpenCC,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Visibility(
              visible: isOpenCC,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "BCC",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )),
                Expanded(
                  flex: 5,
                  child: TextField(
                      decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                    border: InputBorder.none,
                  )),
                )
              ]),
            ),
            Visibility(
              visible: isOpenCC,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                      border: InputBorder.none,
                      hintText: 'Subject')),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                      border: InputBorder.none,
                      hintText: 'Content')),
            ),
          ],
        ),
      ),
    );
  }

  void _showMailSelection() {
    if (Platform.isIOS) _showActionSheet();
  }

  Future<void> _showActionSheet() async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Select mail sender'),
          actions: <Widget>[
            for (var i in mails)
              CupertinoActionSheetAction(
                child: Text('$i'),
                onPressed: () {
                  setState(() {
                    sendToMailIndex = mails.indexOf(i);
                  });
                  Navigator.of(context).pop();
                },
              )
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
