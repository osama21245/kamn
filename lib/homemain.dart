import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/my_account.dart';
import 'package:kman/online_support.dart';
import 'package:kman/theme/pallete.dart';

import 'core/constants/firebase_constants.dart';
import 'drawer/profile_drawer.dart';
import 'home.dart';
import 'models/user_model.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int _currentIndex = 1;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool? inUpdate;

  Future<void> f() async {
    final value = await _firestore
        .collection(FirebaseConstants.appStateCollection)
        .doc("state")
        .get();
    final Map<String, dynamic> data = value.data() as Map<String, dynamic>;
    inUpdate = data["inUpdate"];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [MyAccount(), Home(), OnlineSuport()];
    return FutureBuilder(
      future: f(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done ||
            inUpdate != null) {
          return WillPopScope(
            onWillPop: () async {
              return await Get.defaultDialog();
            },
            child: inUpdate == true
                ? Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: Center(
                      child: Text("Working on Update.."),
                    ),
                  )
                : Scaffold(
                    resizeToAvoidBottomInset: false,
                    bottomNavigationBar: ConvexAppBar(
                      items: [
                        TabItem(
                            icon: Icon(
                              Icons.person_outline_rounded,
                              color: _currentIndex == 0
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            title: "My Account"),
                        TabItem(
                            icon: Icon(
                              Icons.home_outlined,
                              color: _currentIndex == 1
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            title: "home"),
                        TabItem(
                            icon: Icon(
                              Icons.help_outline_sharp,
                              color: _currentIndex == 2
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            title: "Online Support")
                      ],
                      initialActiveIndex: _currentIndex,
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      backgroundColor: Pallete.fontColor,
                    ),
                    drawer: ProfileDrawer(),
                    body: screens.elementAt(_currentIndex),
                  ),
          );
        } else {
          // Return a loading indicator or some placeholder widget
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset("assets/page-1/images/kamn_noBG.png")],
              ),
            ),
          );
        }
      },
    );
  }
}
