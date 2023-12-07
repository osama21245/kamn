import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

StateNotifierProvider<ThemeNotifier, ThemeData> themeNotiferProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) => ThemeNotifier());

class Pallete {
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color.fromRGBO(182, 181, 181, 1); // sec
  static const lightgreyColor = Color.fromARGB(255, 226, 226, 226);
  static const lightgreyColor2 = Color.fromARGB(255, 204, 204, 204);

  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static const ratingColor = Color.fromARGB(255, 251, 255, 42);
  static const fontColor = Color(0xff272361);
  static var primaryColor = Color(0xff3a7cbd);
  static const badmention = Color(0xff5a7ebb);
  static const volleyball = Color(0xfff03636);
  static const basketball = Color(0xffeb811f);
  static const paddel = Color(0xff532fab);
  static const football = Color(0xff21b846);
  static const tennis = Color(0xff98b229);

  static const footballGridentColors = [Color(0x5fffffff), Color(0x5f22b947)];
  static const paddelGridentColors = [Color(0x5fffffff), Color(0x5f542fab)];
  static const basketballlGridentColors = [
    Color(0x5fffffff),
    Color(0x5fec821f)
  ];
  static const volleyballlGridentColors = [
    Color(0x5fffffff),
    Color(0x5ff03636)
  ];
  static const badmentionGridentColors = [Color(0x5fffffff), Color(0x5f5a7ebb)];
  static const tennisGridentColors = [Color(0x5fffffff), Color(0x5f98b229)];
  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
    appBarTheme: AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: primaryColor,
    backgroundColor:
        drawerColor, // will be used as alternative background color
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: blackColor,
        )),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: primaryColor,
    backgroundColor: whiteColor,
  );
}

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeMode _mode;
  ThemeNotifier({ThemeMode mode = ThemeMode.dark})
      : _mode = mode,
        super(
          Pallete.darkModeAppTheme,
        ) {
    getTheme();
  }

  ThemeMode get mode => _mode;

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == 'dark') {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
    } else {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
    }
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
      prefs.setString('theme', 'light');
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
      prefs.setString('theme', 'dark');
    }
  }
}
