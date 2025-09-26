import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/buttons_row.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/features_section.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/gym_owner_row.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/image_stack.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/location_container.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/logo_row.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/open_in_container.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/price_container.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/rating_row.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/read_more_text.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym_details/social_links_section.dart';

class GymDetailsScreen extends StatelessWidget {
  const GymDetailsScreen({
    super.key,
    required this.gym,
  });
  
  final GymModel gym;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageStack(imgList: gym.imagesUrl ?? []),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 3,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LogoRow(
                      logo: gym.logoUrl ?? '',
                      gymName: gym.name ?? '',
                    ),
                    const SizedBox(height: 8),
                    Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LocationContainer(
                              location: gym.address ?? '',
                            ),
                            const SizedBox(height: 8),
                            const RatingRow(),
                          ],
                        ),
                        const Spacer(),
                        const PriceContainer(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomReadMoreText(
                      gymDescription: gym.description ?? ''),
                          
                    const SizedBox(height: 16),
                    FeaturesSection(
                      gymId: gym.id ?? '',
                    ),
                    const OpenInContainer(),
                    const SizedBox(height: 8),
                    Text("Gym Links",
                        style: TextStyles.fontCircularSpotify20AccentBlackMedium),
                    SizedBox(height: 8.h),
                    SocialLinksSection(
                      gymLinksList: gym.scoialMediaLinks ?? [],
                    ),
                    SizedBox(height: 16.h),
                    Text("Gym Owner",
                        style: TextStyles.fontCircularSpotify20AccentBlackMedium),
                    const SizedBox(height: 8),
                     GymOwnerRow(userid: gym.serviceProviderId??""),
                    const SizedBox(height: 16),
                    ButtonsRow(gym: gym),
                    verticalSpace(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
