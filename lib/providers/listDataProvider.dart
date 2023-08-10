import 'package:wireviewer/services/restService.dart';
import 'package:flutter/material.dart';

class ListDataProvider extends ChangeNotifier {
  List<dynamic> data = [];
  String title = "";
  ListDataProvider() {
    setup();
  }

  void setup() async {
    RestService().getCharacterData().then((value) {
      // Logger().d(value);
      data = value["RelatedTopics"];
      title = value["Heading"];
      notifyListeners();
    });
  }

  notify() {
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
