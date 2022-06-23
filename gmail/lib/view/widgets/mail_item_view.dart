import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmail/bloc/mail_bloc.dart';
import 'package:gmail/bloc/mail_event.dart';

const double MAIL_HEADER_SIZE = 16;
const double MAIL_SENDER_SIZE = 17;
const double ATTACK_ICON_SIZE = 16;
const double STAR_ICON_SIZE = 28;
const double AVATAR_SIZE = 45;

class MailItemView extends StatefulWidget {
  int mailIndex;

  MailItemView({Key key, @required this.mailIndex}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MailItemViewState();
}

class MailItemViewState extends State<MailItemView> {
  bool isRead = true;
  bool isStared = false;
  bool isSelected = false;
  ListMailBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<ListMailBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.green,
          child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 10),
            child: Image.asset(
              "assets/images/ic_inbox.png",
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ),
        onDismissed: (direction) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('mail archieved')));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 5, top: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isSelected ? Colors.grey : Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ClipOval(
                    child: Material(
                      color: isSelected
                          ? Colors.blue
                          : Colors.yellow, // button color
                      child: InkWell(
                        child: SizedBox(
                            width: AVATAR_SIZE,
                            height: AVATAR_SIZE,
                            child: isSelected
                                ? Icon(Icons.check)
                                : Icon(Icons.menu)),
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                          debugPrint("on select mail on item");
                          _bloc.add(SelectMailEvent(
                              "mailId${widget.mailIndex}", isSelected));
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text("Code academy sender",
                                style: TextStyle(
                                    fontWeight: isRead
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: MAIL_SENDER_SIZE))),
                        FittedBox(
                          child: Image.asset(
                            "assets/images/ic_attachment.png",
                            width: ATTACK_ICON_SIZE,
                            height: ATTACK_ICON_SIZE,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "17:05",
                          style: TextStyle(
                              fontWeight:
                                  isRead ? FontWeight.bold : FontWeight.normal,
                              fontSize: 13),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Headed of mail here",
                                style: TextStyle(
                                    fontWeight: isRead
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: MAIL_HEADER_SIZE)),
                            Text("here is short content of email",
                                style: TextStyle(fontSize: MAIL_HEADER_SIZE))
                          ],
                        )),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isStared = !isStared;
                                _bloc.add(
                                    UpdateStarStateEvent(isStared, "mailId"));
                              });
                            },
                            child: Icon(
                              isStared
                                  ? Icons.star
                                  : Icons.star_outline_outlined,
                              color: isStared ? Colors.yellow : Colors.grey,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
