import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_implement/addBioScreen.dart';
import 'package:provider_implement/bioData.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var favIcon = Provider.of<BioData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => AddBioScreen(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Image.asset("assets/man.jpg"),
          ListTile(
            leading: Consumer<BioData>(builder: (context, favIcon, child) {
              return IconButton(
                  icon: Icon(
                    favIcon.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    favIcon.favStatus();
                  });
            }),
          ),
        ],
      ),
    );
  }
}
