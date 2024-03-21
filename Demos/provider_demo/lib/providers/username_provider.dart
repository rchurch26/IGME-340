import 'package:flutter/material.dart';

class UsernameProvider extends ChangeNotifier
{
  String username;

  UsernameProvider({this.username = "Rahmen"});

  void changeUsername([String name = "Bruno"])
  {
    username = name;
    notifyListeners();
  }
}