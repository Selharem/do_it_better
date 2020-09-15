import 'package:do_it_better/models/category.dart';
import 'package:do_it_better/screens/Page1.dart';
import 'package:do_it_better/screens/Page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:do_it_better/services/category_service.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}
class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var _category = Category();
  var _CategoryService = CategoryService();

  _showFormDialog(BuildContext context) {
    return showDialog(context: context, barrierDismissible: true,builder: (param) {
      return AlertDialog(
        actions: <Widget>[
              FlatButton(
                color: Colors.red,
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: () async {      
                  _category.name = _categoryNameController.text;
                  _category.description = _categoryDescriptionController.text;

                  var result = await _CategoryService.saveCategory(_category);
                  print(result);
                },
                child: Text('save'),
              ),
            ],
        title: Text('Categories Form'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _categoryNameController,
                decoration: InputDecoration(
                hintText: 'Write a category', labelText: 'Category'),
              ),
              TextField(
                controller: _categoryDescriptionController  ,
                decoration: InputDecoration(
                hintText: 'Write a description',
                labelText: 'Description'),
              )
            ],
          ),
            ),
      );

    });

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          onPressed: () => Navigator.of(context)
            .push( MaterialPageRoute(builder: (context) => Page2())),
          elevation: 0.0,
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          color: Colors.blue,
          ),
        title: Text('cathegories'),
      ),
      body: Center(child: Text('Welcome to cathegories Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showFormDialog(context);
          },
        child: Icon(Icons.add),
        ),
      
    );
  }
}