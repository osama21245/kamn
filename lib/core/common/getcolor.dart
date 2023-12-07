import 'package:flutter/material.dart';

import '../../theme/pallete.dart';

getColor(String collection) {
  final color = collection == "football"
      ? Pallete.football
      : collection == "basketball"
          ? Pallete.basketball
          : collection == "Volleyball"
              ? Pallete.volleyball
              : collection == "Tennis"
                  ? Pallete.tennis
                  : collection == "Badminton"
                      ? Pallete.badmention
                      : collection == "padel"
                          ? Pallete.paddel
                          : Colors.black;

  return color;
}

getGrediantColors(String collection) {
  List<Color> backGroundGridentColor = collection == "football"
      ? Pallete.footballGridentColors
      : collection == "basketball"
          ? Pallete.basketballlGridentColors
          : collection == "Volleyball"
              ? Pallete.volleyballlGridentColors
              : collection == "Tennis"
                  ? Pallete.tennisGridentColors
                  : collection == "Badminton"
                      ? Pallete.badmentionGridentColors
                      : collection == "padel"
                          ? Pallete.paddelGridentColors
                          : Pallete.basketballlGridentColors;
  return backGroundGridentColor;
}
