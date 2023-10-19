import 'package:flutter/material.dart';

class UpdateProvider extends ChangeNotifier {
  String name;
  UpdateProvider({this.name = ""});
  void update({required newName}) {
    name = newName;
    notifyListeners();
  }
}
