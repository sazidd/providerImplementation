import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_implement/provider/itemAddNotifier.dart';

class AddItemScreen extends StatelessWidget {
  AddItemScreen() : super();

  final String title = "Add Items";

  final TextEditingController _itemNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: _itemNameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: "Item Name",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text("Add Item"),
              onPressed: () {
                if (_itemNameController.text.isEmpty) {
                  return;
                }
                Provider.of<ItemAddNotifier>(context,listen: false)
                    .addItem(_itemNameController.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
