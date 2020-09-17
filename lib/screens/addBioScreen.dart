import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_implement/addBioData.dart';
import 'package:provider_implement/bioData.dart';

class AddBioScreen extends StatefulWidget {
  @override
  _AddBioScreenState createState() => _AddBioScreenState();
}

class _AddBioScreenState extends State<AddBioScreen> {
  final _form = GlobalKey<FormState>();

  var _editBioData = BioData(
    id: null,
    name: "",
    description: "",
  );

  _saveForm() {
    _form.currentState.save();
    if (_editBioData.id == null) {
      Provider.of<AddBioData>(context, listen: false).addProduct(_editBioData);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Bio"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                onSaved: (value) {
                  _editBioData = BioData(
                    id: _editBioData.id,
                    name: value,
                    description: _editBioData.description,
                  );
                },
                decoration: InputDecoration(
                  labelText: "Name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                onSaved: (value) {
                  _editBioData = BioData(
                    id: _editBioData.id,
                    name: _editBioData.name,
                    description: value,
                  );
                },
                decoration: InputDecoration(
                  labelText: "Description",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
