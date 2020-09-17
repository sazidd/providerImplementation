import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final int id;
  final String name;
  final String description;

  UserProductItem({this.id, this.name, this.description});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(description),
    );
  }
}
