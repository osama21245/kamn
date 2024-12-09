import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports/data/models/filter_model.dart';

@injectable
class SportsGroundViewModel {
  TextEditingController searchController = TextEditingController();
  TextEditingController loactionController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  var distance = 0.0;
  var userLatitude = 0.0;
  var userLongitude = 0.0;
  List<FilterModel?> filterItem = [];

  void dispoe() {
    searchController.dispose();
    loactionController.dispose();
    maxPriceController.dispose();
    minPriceController.dispose();
  }
}
