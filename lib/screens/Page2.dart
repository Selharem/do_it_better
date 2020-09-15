import 'package:do_it_better/helper/drawer_navigation.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
        
      ),
      drawer: DrawerNavigaton(),
      ));
  }
}