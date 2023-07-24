import 'dart:convert';

import 'package:http/http.dart' as http;

class MeatRepository{
  Future<List<dynamic>> getData() async {
    List<dynamic> meatList = [];
    var url = Uri.parse('https://baconipsum.com/api/?type=meat-and-filler');
    final response = await http.get(url);
    if (response.statusCode == 200) {

      List<dynamic> data = jsonDecode(response.body);
      meatList = data;

      print('data success ${data[0]}');
      ///meatList =
    } else {
        print('data err');
    }

    return meatList;
  }
}