import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kman/my_account.dart';
import 'package:kman/online_support.dart';
import 'package:kman/theme/pallete.dart';

import 'home.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [MyAccount(), Home(), OnlineSuport()];
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(
              icon: Icon(
                Icons.person_outline_rounded,
                color: _currentIndex == 0 ? Colors.black : Colors.white,
              ),
              title: "My Account"),
          TabItem(
              icon: Icon(
                Icons.home_outlined,
                color: _currentIndex == 1 ? Colors.black : Colors.white,
              ),
              title: "home"),
          TabItem(
              icon: Icon(
                Icons.help_outline_sharp,
                color: _currentIndex == 2 ? Colors.black : Colors.white,
              ),
              title: "Online Support")
        ],
        initialActiveIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Pallete.primaryColor,
      ),
      body: screens.elementAt(_currentIndex),
    );
  }
}
