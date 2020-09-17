import 'package:flutter/material.dart';
import 'package:provider_implement/bioData.dart';

class AddBioData extends ChangeNotifier {
  
  List<BioData> _items = [];

  List<BioData> get items {
    return [..._items];
  }

  void addProduct(BioData data) {
    final newData = BioData(
      id: data.id,
      name: data.name,
      description: data.description,
    );
    _items.add(newData);
    notifyListeners();
  }

  Future<void> fetchAndSetData(BioData bioData) async {
    final List<BioData> loadedBioData = [];
    loadedBioData.add(BioData(
      id: bioData.id,
      name: bioData.name,
      description: bioData.description,
    ));
    _items = loadedBioData;
    notifyListeners();
  }
}
