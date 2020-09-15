import 'package:flutter/material.dart';
import 'package:do_it_better/helper/app.dart';
import 'package:do_it_better/helper/bottom_navigation.dart';
import 'package:do_it_better/screens/Page1.dart';
import 'package:do_it_better/screens/Page2.dart';
import 'package:do_it_better/screens/Page3.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {

    Widget child ;
    if(tabItem == "Page1")
      child = Page1();
    else if(tabItem == "Page2")
      child = Page2();
    else if(tabItem == "Page3")
      child = Page3();
    
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child
        );
      },
    );
  }
} 