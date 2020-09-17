import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_implement/addBioData.dart';
import 'package:provider_implement/addBioScreen.dart';
import 'package:provider_implement/bioData.dart';
import 'package:provider_implement/userProductItem.dart';

class UserProductScreen extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<AddBioData>(context, listen: false).fetchAndSetData(
      BioData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bioData = Provider.of<AddBioData>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => AddBioScreen(),
                  ),
                );
              })
        ],
      ),
      body: Consumer(
        builder: (context, data, child) {
          return RefreshIndicator(
            onRefresh: () => _refreshProducts(context),
            child: ListView.builder(
              itemCount: bioData.items.length,
              itemBuilder: (context, indext) => UserProductItem(),
            ),
          );
        },
      ),
    );
  }
}
