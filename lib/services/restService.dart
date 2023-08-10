import 'package:wireviewer/env.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestService {
  Future<Map<String, dynamic>> getCharacterData() async {
    final response = await http.get(Uri.parse(environment["dataUrl"]));

    if (response.statusCode == 200) {
      var resData = jsonDecode(response.body);
      return resData;
    } else {
      throw Exception('Failed to load response');
    }
  }
}
