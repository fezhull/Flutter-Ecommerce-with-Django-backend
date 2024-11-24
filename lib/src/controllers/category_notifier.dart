import 'package:flutter/material.dart';

class CategoryNotifier with ChangeNotifier {
  String category = '';

  void setCategory(String c, id) {
    category = c;
    notifyListeners();
  }

  int _id = 0;

  int get id => _id;

  void setId(int id) {
    _id = id;
  }
}
