import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmail/bloc/drawer_bloc.dart';
import 'package:gmail/bloc/drawer_event.dart';
import 'package:gmail/bloc/mail_bloc.dart';
import 'package:gmail/bloc/mail_event.dart';
import 'package:gmail/model/email_object.dart';
import 'package:gmail/router/router.dart';
import 'package:gmail/view/dialog/account_setting_dialog.dart';
import 'package:gmail/view/widgets/mail_action_bar_view.dart';
import 'package:gmail/view/widgets/mail_item_view.dart';
import 'package:gmail/view/widgets/search_mail_view.dart';

class AllMailView extends StatefulWidget {
  VoidCallback openDrawerMenu;

  AllMailView({Key key, this.openDrawerMenu}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AllMailViewState();
}

class _AllMailViewState extends State<AllMailView>
    with AutomaticKeepAliveClientMixin {
  String currentLabel = "Inbox";
  ScrollController _controller;
  double SEARCH_OFFSET = 5;
  double lastOffset = 0;
  bool isExtendFab = false;
  bool isMailsSelected = false;
  List<EmailObject> mails = [];
  List selectedMails = [];

  @override
  void initState() {
    debugPrint("_AllMailViewState initState");
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ListMailBloc, MailStates>(
          builder: (context, mailState) {
            if (mailState is SelectedMailState) {
              if (mailState.isSelected) {
                if (!selectedMails.contains(mailState.mailId))
                  selectedMails.add(mailState.mailId);
              } else {
                selectedMails.remove(mailState.mailId);
              }
              isMailsSelected = selectedMails.isNotEmpty;
            }

            return BlocBuilder<DrawerBloc, DrawerState>(
              builder: (context, state) {
                if (state is SelectedMenuState) {
                  switch (state.selectedIndex) {
                    case 1:
                      currentLabel = "All mail inbox";
                      break;
                    case 2:
                      currentLabel = "Inbox";
                      break;
                    case 4:
                      currentLabel = "Stared mails";
                      break;
                    default:
                      currentLabel = "other mails label";
                  }
                }
                // if (state is SelectAllMailInbox) {
                // } else if (state is SelectMailInbox) {
                // } else if (state is SelectStaredLabel) {
                // } else if (state is SelectOtherLabel) {}

                return Container(
                  child: Stack(
                    children: [
                      Container(
                        child: _ListMail(LabelType.all),
                      ),
                      isMailsSelected
                          ? Positioned(
                              top: 0,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width,
                                    minHeight: 60),
                                child: ControlMailAppBar(
                                  mailSelected: selectedMails.length,
                                ),
                              ))
                          : Positioned(
                              top: SEARCH_OFFSET,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width,
                                    minHeight: 60),
                                child: SearchMailView(
                                    openDrawerMenu, showUserDialog),
                              )),
                    ],
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context,
                  AppRouter.generateRoute(RouteSettings(name: composeRoute)));
            },
            label: AnimatedSwitcher(
              duration: Duration(milliseconds: 700),
              transitionBuilder: (Widget child, Animation<double> animation) =>
                  FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  child: child,
                  sizeFactor: animation,
                  axis: Axis.horizontal,
                ),
              ),
              child: isExtendFab
                  ? Icon(Icons.add)
                  : Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 4,
                        ),
                        Text("Write mail")
                      ],
                    ),
            )));
  }

  void openDrawerMenu() {
    widget.openDrawerMenu();
  }

  void showUserDialog(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AccountSettingDialog();
        });
  }

  Widget _ListMail(LabelType type) {
    return ListView.builder(
        controller: _controller,
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              height: 80,
            );
          } else if (index == 1) {
            return Container(
              margin: EdgeInsets.all(5),
              child: Text("$currentLabel"),
            );
          } else {
            return MailItemView(
              mailIndex: index,
            );
          }
        });
  }

  _scrollListener() {
    if (_controller.offset < 0) return;

    if (_controller.offset > lastOffset &&
        _controller.offset - lastOffset > 10) {
      lastOffset = _controller.offset;
      if (SEARCH_OFFSET > -70) {
        setState(() {
          SEARCH_OFFSET -= 10;
        });
      }
    }

    if (_controller.position.userScrollDirection == ScrollDirection.forward) {
      setState(() {
        isExtendFab = false;
      });
    } else {
      setState(() {
        isExtendFab = true;
      });
    }

    if (_controller.offset < lastOffset &&
        lastOffset - _controller.offset > 10) {
      lastOffset = _controller.offset;
      if (SEARCH_OFFSET < 5) {
        setState(() {
          SEARCH_OFFSET += 10;
        });
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}
