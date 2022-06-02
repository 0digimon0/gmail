import 'package:flutter/material.dart';
import 'package:gmail/model/email_object.dart';
import 'package:gmail/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: firstRoute,
    );
  }
}

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();

    Future(() {
      Account user = new Account();
      Navigator.pushReplacementNamed(context, homeRoute, arguments: user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class UserDataPage extends InheritedWidget {
  final Account user;

  const UserDataPage({
    Key key,
    @required this.user,
    @required Widget child,
  })  : assert(user != null),
        assert(child != null),
        super(key: key, child: child);

  static UserDataPage of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserDataPage>();
  }

  @override
  bool updateShouldNotify(UserDataPage old) => user != old.user;
}
