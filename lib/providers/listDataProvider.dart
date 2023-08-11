import 'package:wireviewer/services/restService.dart';
import 'package:flutter/material.dart';

class ListDataProvider extends ChangeNotifier {
  List<dynamic> data = [];
  List<dynamic> initialData = [];
  String title = "";
  ListDataProvider() {
    setup();
  }

  void setup() async {
    RestService().getCharacterData().then((value) {
      // Logger().d(value);
      initialData = value["RelatedTopics"];
      data = initialData.where((element) => true).toList();
      title = value["Heading"];
      notifyListeners();
    });
  }

  filterResults(String key) {
    clearSelections();
    data = initialData.where(
      (element) {
        return (element["Text"] as String)
            .toLowerCase()
            .contains(key.toLowerCase());
      },
    ).toList();
    notifyListeners();
  }

  clearSelections() {
    for (int i = 0; i < data.length; i++) {
      data[i]["selected"] = false;
    }
    for (int i = 0; i < initialData.length; i++) {
      initialData[i]["selected"] = false;
    }
  }

  clearFilters() {
    clearSelections();
    data = initialData.where((element) => true).toList();
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
