import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_implement/provider/bioData.dart';
import 'package:provider_implement/provider/itemAddNotifier.dart';
import 'package:provider_implement/screens/addBioScreen.dart';

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
        title: Text("HomePage"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => AddItemScreen(),
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
          Container(
            color: Colors.white,
            height: 200,
            child: Column(
              children: [
                Expanded(
                  child: Consumer<ItemAddNotifier>(
                      builder: (context, itemAddNotifier, _) {
                    return ListView.builder(
                        itemCount: itemAddNotifier.itemList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              itemAddNotifier.itemList[index].itemName,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          );
                        });
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//  Container(
//           padding: EdgeInsets.all(30.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: Consumer<ItemAddNotifier>(
//                     builder: (context, itemAddNotifier, _) {
//                   return ListView.builder(
//                       itemCount: itemAddNotifier.itemList.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: EdgeInsets.all(15.0),
//                           child: Text(
//                             itemAddNotifier.itemList[index].itemName,
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.black,
//                             ),
//                           ),
//                         );
//                       });
//                 }),
//               )
//             ],
//           ),
//         ),
