// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomPlaySearch extends ConsumerWidget {
  String category;
  Size size;
  CustomPlaySearch({
    required this.category,
    required this.size,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.045),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: size.height * 0.042,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(28, 1, 99, 179),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/page-1/images/search.png",
                            width: size.width * 0.04,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: size.width * 0.02,
                              bottom: size.width * 0.022,
                              top: size.width * 0.022),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(144, 12, 73, 185),
                                border: Border(
                                    right: BorderSide(
                                        width: 0.3,
                                        color:
                                            Color.fromARGB(144, 12, 73, 185)))),
                          ),
                        ),
                        Text(
                          "Search for $category...",
                          style: TextStyle(
                            color: Color.fromARGB(144, 12, 73, 185),
                            fontSize: size.width * 0.03,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/page-1/images/playFiltering.png"))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
