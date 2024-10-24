import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/image_picker.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_model.dart';

import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider/service_provider_cubit.dart';

class CustomeFinishedButton extends StatelessWidget {
  const CustomeFinishedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 76.w),
      child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: AppPallete.blackColor),
          onPressed: () {
            if (context
                    .read<ServiceProviderCubit>()
                    .formKey
                    .currentState
                    ?.validate() ==
                true) {
              context.read<ServiceProviderCubit>().compressImage();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,
                  color: AppPallete.lightGreen),
              horizontalSpace(7.w),
              Text(
                Constants.finish,
                style: TextStyles.fontInter16WhiteMedium,
              )
            ],
          )),
    );
  }
}
