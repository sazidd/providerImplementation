import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_implement/favprovider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var favIcon = Provider.of<FavIcon>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("assets/man.jpg"),
          ListTile(
            leading: Consumer<FavIcon>(builder: (context, favIcon, child) {
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
