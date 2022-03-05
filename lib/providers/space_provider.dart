import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bwa_cozy/models/space.dart';

class SpaceProvider extends ChangeNotifier {
  getRecomendedSpaces() async {
    var result = await http.get(Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces'));
    

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
