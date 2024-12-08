import 'package:flutter/material.dart';
import 'package:kamn/features/sports/data/models/filter_model.dart';

class SportsGroundViewModel {
  static var searchController = TextEditingController();
  static var loactionController = TextEditingController();
  static var dateController = TextEditingController();
  static var maxPriceController = TextEditingController();
  static var minPriceController = TextEditingController();
  static var distance = 0.0;
  static List<FilterModel?> filterData = [];
}
