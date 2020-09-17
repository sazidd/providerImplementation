import 'package:flutter/cupertino.dart';

class FavIcon extends ChangeNotifier {
  bool isFavourite;

  FavIcon({this.isFavourite = false});

  void _setFavValue(bool newValue) {
    isFavourite = newValue;
    notifyListeners();
  }

  void favStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
