import 'package:flutter/material.dart';
import 'package:kman/my_account.dart';

class BottomAppBarClass {
  Widget page;
  String title;
  var icon;

  BottomAppBarClass(this.icon, this.page, this.title);
}

List<BottomAppBarClass> bottomAppBarList = [
  BottomAppBarClass(Icons.person_outline, MyAccount(), "MyAccount"),
  BottomAppBarClass(Icons.help_outline_outlined, MyAccount(), "Online Support")
];
