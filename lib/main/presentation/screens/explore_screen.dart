import 'package:flutter/material.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/main/presentation/widgets/home/custom_search_row.dart';
import 'package:kamn/main/presentation/widgets/explore/build_tap_content.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearchRow(),
              const SizedBox(height: 20),
              
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppPallete.whiteGreyColor),
                  boxShadow: [
                    BoxShadow(
                      color: AppPallete.greyColor.withValues(alpha: .1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  controller: _tabController,
                  labelColor: Colors.white,
                  labelStyle: TextStyles.fontCircularSpotify14AccentBlackMedium
                      .copyWith(fontWeight: FontWeight.w400),
                  unselectedLabelColor: Colors.black,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tabs: categories
                      .map((category) => Tab(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(category),
                            ),
                          ))
                      .toList(),
                ),
              ),
              
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: categories
                      .map((category) => buildTabContent(category, context))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}



