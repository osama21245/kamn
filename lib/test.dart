import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/main/presentation/widgets/home/custom_gradiant_text.dart';
import 'package:kamn/main/presentation/widgets/home/custom_menu_container.dart';
import 'package:sliver_snap/sliver_snap.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  bool isAppBarCollapsed = false;

  @override
  void initState() {
    super.initState();
    // Listen to scroll events to detect SliverAppBar state
    _scrollController.addListener(() {
      // Calculate the maximum scroll extent for collapsing
      const expandedHeight = 150.0;
      const toolbarHeight = 60.0;
      final maxScrollExtent = expandedHeight - toolbarHeight;

      // Check if the app bar is collapsed or expanded
      bool newIsCollapsed = _scrollController.hasClients &&
          _scrollController.offset >=
              maxScrollExtent - 10; // Small threshold for smoother detection

      if (newIsCollapsed != isAppBarCollapsed) {
        setState(() {
          isAppBarCollapsed = newIsCollapsed;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverSnap(
      onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {},
      collapsedBackgroundColor: Colors.black,
      expandedBackgroundColor: Colors.transparent,
      backdropWidget: Image.network(
        "https://picsum.photos/800/1200",
        fit: BoxFit.cover,
      ),
      leading: CustomMenuContainer(
        onTap: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: () {},
        ),
      ],
      expandedContentHeight: 150,
      expandedContent:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 60.w, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomGradiantText(),
                  const SizedBox(height: 4),
                  Text(
                    "userName",
                    style: TextStyles.fontCircularSpotify20AccentBlackMedium
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "location     ⛅ temperature",
                    style: TextStyles.fontCircularSpotify10BlackRegular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      collapsedContent: const Text(
          'Sample App Bar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
    
      body: const Material(
        elevation: 7,
        child: Placeholder(),
      ),
    );
  }
}

class CustomeAppBar extends StatelessWidget {
  final String userName;
  final String location;
  final String temperature;
  final String? profileImageUrl;
  final VoidCallback? onMenuTap;

  const CustomeAppBar({
    super.key,
    this.userName = "Mahmoud Sayed",
    this.location = "San Stefano, Alex",
    this.temperature = "21°C",
    this.profileImageUrl,
    this.onMenuTap,
  });

  // Function to determine greeting based on time of day
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      toolbarHeight: 60,
      expandedHeight: 150.0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: CustomMenuContainer(
        onTap: onMenuTap ??
            () {
              Scaffold.of(context).openDrawer();
            },
      ),
      actions: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Stack(
              children: [
                Image.asset(ImageLinks.notification),
                const Positioned(
                  top: 2,
                  right: 2,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 4,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        const CircleAvatar(
          radius: 20,
          backgroundImage: ExactAssetImage(ImageLinks.user),
        ),
      ],
      actionsPadding: const EdgeInsets.all(10),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          userName,
          style: TextStyles.fontCircularSpotify20AccentBlackMedium
              .copyWith(fontWeight: FontWeight.w400),
        ),
        titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
        background: Padding(
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getGreeting(),
                      style: TextStyles.fontCircularSpotify20AccentBlackMedium
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    const CustomGradiantText(),
                    const SizedBox(height: 4),
                    Text(
                      userName,
                      style: TextStyles.fontCircularSpotify20AccentBlackMedium
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$location     ⛅ $temperature",
                      style: TextStyles.fontCircularSpotify10BlackRegular,
                    ),
                  ],
                ),
              ),
              if (profileImageUrl != null)
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profileImageUrl!),
                )
              else
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: ExactAssetImage(ImageLinks.user),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
