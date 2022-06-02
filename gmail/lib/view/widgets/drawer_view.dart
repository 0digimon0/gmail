import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmail/bloc/drawer_bloc.dart';
import 'package:gmail/bloc/drawer_event.dart';
import 'package:gmail/model/label.dart';

import 'drawer_menu_item.dart';

final int ALL_MAIL_INDEX = 1;
final int INBOX_INDEX = 2;

class DrawerView extends StatelessWidget {
  DrawerBloc drawerBloc;
  List<Label> recentLabels = [];
  List<Label> allLabels = [];

  int itemCount = 3;
  int selectedIndex = 1;

  DrawerView(DrawerBloc _drawerBloc) {
    print("init drawer view, is nil: ${_drawerBloc == null}");
    drawerBloc = _drawerBloc;
    drawerBloc.add(LoadAllLabelsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocBuilder<DrawerBloc, DrawerState>(
        builder: (context, state) {
          if (state is LoadedAllLabelsState) {
            allLabels = state.allLabel;
            print(
                "drawer - LoadedAllLabelsState with size: ${allLabels.length}");
          }
          if (state is SelectedMenuState) {
            print("drawer -- SelectedMenuState: $selectedIndex");
            selectedIndex = state.selectedIndex;
          }

          return _ListMenu();
        },
      ),
    );
  }

  Widget _ListMenu() {
    itemCount = 3 + allLabels.length + recentLabels.length;
    return ListView.builder(
        physics: new BouncingScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index == 0) {
            return DrawerBanner();
          } else if (index == 1) {
            return DrawerAllMail(selectedIndex);
          } else if (index == 2) {
            return DrawerInbox(selectedIndex);
          } else {
            if (recentLabels.isNotEmpty) {
              if (index == 3) {
                //header for recent labels
              } else if (index > 3 && index < 4 + recentLabels.length) {
                // for recent labels
              } else if (index == 4 + recentLabels.length) {
                // header for all labels
              } else {
                // for all labels
                return DrawerMenuItemView(
                    allLabels[index - 5 - recentLabels.length],
                    index,
                    selectedIndex);
              }
            } else {
              if (index == 3) {
                //header for all labels
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 5, 5),
                  child: Text(
                    "All labels",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                );
              } else {
                return DrawerMenuItemView(
                    allLabels[index - 4], index, selectedIndex);
              }
            }
            return Container();
          }
        });
  }
}

class DrawerBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          "assets/images/gmail_logo.jpg",
          width: 50.0,
          height: 20.0,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class DrawerAllMail extends StatelessWidget {
  int _selectedIndex;
  DrawerAllMail(this._selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //divider
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),

          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: DrawerMenuItemView(
                  Label(0, "All mail", "", 50), ALL_MAIL_INDEX, _selectedIndex),
            ),
          ),

          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),

          //text + ripple effect
          //divider
        ],
      ),
    );
  }
}

class DrawerInbox extends StatelessWidget {
  int _selectedIndex;

  DrawerInbox(this._selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DrawerMenuItemView(
            Label(0, "Inbox", "", 30), INBOX_INDEX, _selectedIndex),
      ),
    );
  }
}
