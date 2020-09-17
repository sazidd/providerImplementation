import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_implement/favprovider.dart';

import 'homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => FavIcon(),
        child: HomePage(),
      ),
    );
  }
}
