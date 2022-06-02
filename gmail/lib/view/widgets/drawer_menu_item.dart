import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmail/bloc/drawer_bloc.dart';
import 'package:gmail/bloc/drawer_event.dart';
import 'package:gmail/model/label.dart';

class DrawerMenuItemView extends StatelessWidget {
  Label label;
  bool isSelected = false;
  int menuIndex;
  int selectedIndex;
  Color bgColor = Colors.grey;

  DrawerMenuItemView(this.label, int _menuIndex, int _selectedIndex, {Key key})
      : super(key: key) {
    //print("init drawer menu item id: ${label.iconUrl}");
    menuIndex = _menuIndex;
    isSelected = _menuIndex == _selectedIndex;
    bgColor = (menuIndex < 3) ? Colors.orange : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      height: 50,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: isSelected ? bgColor : Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),
          InkWell(
            onTap: () {
              DrawerBloc _drawerBloc = BlocProvider.of<DrawerBloc>(context);
              if (_drawerBloc != null) {
                print("menuitem - ontap not null id: ${menuIndex}");
                Scaffold.of(context).openEndDrawer();
                _drawerBloc.add(MenuClickEvent(menuIndex));
                isSelected = !isSelected;
              } else {
                print("menuitem - ontap is null");
              }
            },
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.center,
                          child: (label.iconUrl != "")
                              ? Image.asset(
                                  "assets/images/${label.iconUrl}.png",
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.contain,
                                )
                              : Container()),
                    )),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        label.name,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        label.count == 0
                            ? ""
                            : (label.count > 99 ? "+99" : "${label.count}"),
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        textAlign: TextAlign.right,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
