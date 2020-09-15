import 'package:flutter/material.dart';
import 'package:do_it_better/helper/tab_navigator.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:custom_navigator/custom_scaffold.dart';
import 'package:do_it_better/screens/Page1.dart';
import 'package:do_it_better/screens/Page2.dart';
import 'package:do_it_better/screens/Page3.dart';




/////////////////////////////////////////////////////////////////////////////
/// NORMAL NAVIGATOR SOLUTION
////////////////////////////////////////////////////////////////////////////
/*class NormalBottomNavBar extends StatefulWidget {
  NormalBottomNavBar({Key key}) : super(key: key);

  @override
  NormalBottomNavBarState createState() => NormalBottomNavBarState();
}

class NormalBottomNavBarState extends State<NormalBottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Page1(),
    Page2(),
    Page3(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: _children[_currentIndex], // new
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.looks_one),
            title: new Text('Page1'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.looks_two),
            title: new Text('Page2'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.looks_3),
            title: new Text('Page3'),
          ),
       ],
     ),
   );
  }
}*/

/////////////////////////////////////////////////////////////////////////////
/// DIY NAVIGATOR SOLUTION
////////////////////////////////////////////////////////////////////////////
/*class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  String _currentPage = "Page1";
  List<String> pageKeys = ["Page1", "Page2", "Page3"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;


  void _selectTab(String tabItem, int index) {
    if(tabItem == _currentPage ){
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
          child: Scaffold(
        body: Stack(
          children:<Widget>[
            _buildOffstageNavigator("Page1"),
            _buildOffstageNavigator("Page2"),
            _buildOffstageNavigator("Page3"),
          ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          onTap: (int index) { _selectTab(pageKeys[index], index); },
          currentIndex: _selectedIndex, 
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.looks_one),
              title: new Text('Page1'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.looks_two),
              title: new Text('Page2'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.looks_3),
              title: new Text('Page3'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
   
  }



  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}*/


/////////////////////////////////////////////////////////////////////////////
/// CUPERTINO SOLUTION
////////////////////////////////////////////////////////////////////////////
/*class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page1(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page2(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page3(),
              );
            });
          default: return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page1(),
              );
            });
        }
      },
    );
  }
}*/


/////////////////////////////////////////////////////////////////////////////
/// CUSTOM NAVIGATOR OR CUSTOM SCAFFOLD
////////////////////////////////////////////////////////////////////////////
/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _children = [
    Page1(),
    Page2(),
    Page3(),
  ];
  Widget _page = Page1();
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar: BottomNavigationBar(
  //       items: _items,
  //       onTap: (index) {

  //         navigatorKey.currentState.maybePop();
  //         setState(() => _page = _children[index]);
  //         _currentIndex = index;
  //       },
  //       currentIndex: _currentIndex,
  //     ),
  //     body: CustomNavigator(
  //       navigatorKey: navigatorKey,
  //       home: _page,
  //       pageRoute: PageRoutes.materialPageRoute,
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.looks_one),
            title: new Text('Page1'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.looks_two),
            title: new Text('Page2'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.looks_3),
            title: new Text('Page3'),
          ),
      ],),
      ),
    children: <Widget>[
       Page1(),
        Page2(),
        Page3(),
    ],

      onItemTap: (index) {},
    );
  }
}*/


class CustomNavigatorHomePage extends StatefulWidget {
  CustomNavigatorHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CustomNavigatorHomePageState createState() => _CustomNavigatorHomePageState();
}

class _CustomNavigatorHomePageState extends State<CustomNavigatorHomePage> {
  final List<Widget> _children = [
    Page1(),
    Page2(),
    Page3(),
  ];
  Widget _page = Page1();
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        onTap: (index) {
          navigatorKey.currentState.maybePop();
          setState(() => _page = _children[index]);
          _currentIndex = index;
        },
        currentIndex: _currentIndex,
      ),
      body: CustomNavigator(
        navigatorKey: navigatorKey,
        home: _page,
        pageRoute: PageRoutes.materialPageRoute,
      ),
    );
  }
  final _items = [
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/notes.png"),
        ),
      title: Text('Notes'),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/audit.png"),
        ),
        title: Text('Tasks'),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/target.png"),
        ),
        title: Text('Challenges'),
    ),
  ];
}
