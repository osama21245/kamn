import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/navigation.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports_service_providers/data/data_source/service_providers_remote_data_source.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_model.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider/service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider/service_provider_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/success_service_provider_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_finished_button.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_image_picker.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_service_info.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_text_title.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_grounds/custom_app_bar_service_provider.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void disposeControllers(BuildContext context) {
      context.read<ServiceProviderCubit>().nameController.dispose();
      context.read<ServiceProviderCubit>().phoneController.dispose();
      context.read<ServiceProviderCubit>().addressController.dispose();
      context.read<ServiceProviderCubit>().sizeController.dispose();
      context.read<ServiceProviderCubit>().governateController.dispose();
    }

    PlaygroundModel prepareData(BuildContext context) => PlaygroundModel(
          name: context.read<ServiceProviderCubit>().nameController.text.trim(),
          phone:
              context.read<ServiceProviderCubit>().phoneController.text.trim(),
          address: context
              .read<ServiceProviderCubit>()
              .addressController
              .text
              .trim(),
          size: int.parse(
              context.read<ServiceProviderCubit>().sizeController.text.trim()),
          govenrate:
              context.read<ServiceProviderCubit>().governateController.text,
          images: context.read<ServiceProviderCubit>().imagesUrl,
          latitude:
              context.read<ServiceProviderCubit>().coordinates['latitude'],
          longitude:
              context.read<ServiceProviderCubit>().coordinates['longitude'],
          ownerId: "under develop",
          price: 0000,
          description: "under develop",
          status: "under develop",
        );

    return BlocConsumer<ServiceProviderCubit, ServiceProviderState>(
      listener: (context, state) {
        if (state.isImageCompressed) {
          context.read<ServiceProviderCubit>().addImagesToStorage();
        }
        if (state.isImageUploaded) {
          context.read<ServiceProviderCubit>().addService(prepareData(context));
        }
        if (state.isSuccess) {
          navigationTo(context, const SuccessServiceProviderScreen());
        } else if (state.isFailure) {
          showSnackBar(context, state.erorrMessage!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBarServiceProvider.appBar(
            arrowFunction: () {},
            notificationIconFunction: () {},
            profileFunction: () {},
            badgesIconFunction: () {},
          ),
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppPallete.mainColor,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomeTextTitle(),
                        verticalSpace(19.h),
                        CustomeImagePicker(
                          selectedImages: state.imagesList ?? [],
                          onRemoveImage: (image) {
                            context
                                .read<ServiceProviderCubit>()
                                .removeImageFromList(image);
                          },
                          onAddImage: () {
                            context
                                .read<ServiceProviderCubit>()
                                .getPhotoFromGallery();
                          },
                        ),
                        verticalSpace(7.h),
                        CustomeServiceInfo(
                          isLoading: state.isLocationLoading,
                        ),
                        const CustomeFinishedButton(),
                        verticalSpace(25.h),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
