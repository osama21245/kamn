import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kamn/core/helpers/spacer.dart';

import 'package:kamn/features/sports_service_providers/presentation/widgets/custome_app_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/custome_finished_button.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/custome_image_picker.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/custome_service_info.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/custome_text_title.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: const CustomeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomeTextTitle(),
              verticalSpace(19.h),
              CustomeImagePicker(),
              verticalSpace(7.h),
              CustomeServiceInfo(),
              CustomeFinishedButton(),
              verticalSpace(25.h),
            ],
          ),
        ),
      ),
    );
  }
}
