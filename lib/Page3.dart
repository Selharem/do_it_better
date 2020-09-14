import 'package:flutter/material.dart';


class Page3 extends StatelessWidget {
  const Page3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
        actions:<Widget>[
          IconButton(icon: Icon(Icons.ac_unit), onPressed: (){
            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) =>
                  new Page3()));

          })
        ]
      ),
      body: Align(
        alignment: Alignment.center,
        child: FlatButton(color: Colors.blue, textColor: Colors.white, onPressed: (){
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) =>
                  new ListViewPage()));
        }, child: Text("Switch Page - Comment")))
      ));
  } 
}
class ListViewPage extends StatelessWidget {
  const ListViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Infinite List"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(leading: Text("$index"), title: Text("Number $index"));
        },
      ),
    );
  }
}