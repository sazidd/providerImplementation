import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_implement/provider/bioData.dart';
import 'package:provider_implement/provider/itemAddNotifier.dart';

import 'screens/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BioData(),
        ),
        ChangeNotifierProvider(
          create: (_) => ItemAddNotifier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
