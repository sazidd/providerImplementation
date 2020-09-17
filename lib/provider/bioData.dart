import 'package:flutter/cupertino.dart';

class BioData extends ChangeNotifier {
  final int id;
  final String name;
  final String description;
  bool isFavourite;

  BioData({
    this.id,
    this.name,
    this.description,
    this.isFavourite = false,
  });

  setFavValue(bool newValue) {
    isFavourite = newValue;
    notifyListeners();
  }

  void favStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
