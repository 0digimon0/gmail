import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmail/bloc/drawer_bloc.dart';
import 'package:gmail/bloc/drawer_event.dart';
import 'package:gmail/bloc/mail_bloc.dart';
import 'package:gmail/bloc/mail_event.dart';
import 'package:gmail/model/email_object.dart';
import 'package:gmail/services/repository/label_repository.dart';
import 'package:gmail/view/screen/meeting_page.dart';
import 'package:gmail/view/widgets/drawer_view.dart';

import '../../main.dart';
import 'all_email_page.dart';

int TAB_COUNT = 2;

class HomePage extends StatelessWidget {
  final Account account;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isShowingAppbar = false;

  HomePage({this.account}) {
    drawerBloc =
        DrawerBloc(LoadingAllLabelState(), repository: LabelRepositoryImp());

    listMailBloc = ListMailBloc(InitListState());
  }
  DrawerBloc drawerBloc;
  ListMailBloc listMailBloc;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TAB_COUNT,
      child: BlocProvider<DrawerBloc>(
        create: (context) => drawerBloc,
        child: SafeArea(
            child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          drawer: Drawer(
            child: DrawerView(drawerBloc),
          ),
          body: UserDataPage(
              user: account,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  BlocProvider<ListMailBloc>(
                    create: (context) => listMailBloc,
                    child: AllMailView(
                      key: UniqueKey(),
                      openDrawerMenu: openDrawerMenu,
                    ),
                  ),
                  MeetingPage(),
                ],
              )),
          bottomNavigationBar:
              menu(), // This trailing comma makes auto-formatting nicer for build methods.
        )),
      ),
    );
  }

  void openDrawerMenu() {
    _scaffoldKey.currentState.openDrawer();
  }

  Widget menu() {
    return Container(
      color: Colors.white,
      child: TabBar(
        physics: NeverScrollableScrollPhysics(),
        labelColor: Colors.red,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(10.0),
        tabs: [
          Tab(
            text: "Mail",
            icon: Icon(Icons.mail),
          ),
          Tab(
            text: "Meeting",
            icon: Icon(Icons.meeting_room),
          )
        ],
      ),
    );
  }
}
