import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_implement/addBioData.dart';
import 'package:provider_implement/bioData.dart';

import 'homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => BioData(),
          ),
          ChangeNotifierProvider(
            create: (_) => AddBioData(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
