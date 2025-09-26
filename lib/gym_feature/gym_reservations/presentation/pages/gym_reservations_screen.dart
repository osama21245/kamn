import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/gym_reservations/presentation/cubit/gym_reservations_cubit.dart';
import 'package:kamn/gym_feature/gym_reservations/presentation/cubit/gym_reservations_state.dart';
import 'package:kamn/gym_feature/gym_reservations/presentation/widgets/reservation_card.dart';
import 'package:kamn/main/presentation/widgets/home/custom_app_bar.dart';
import 'package:kamn/main/presentation/widgets/home/custom_drawer.dart';

class GymReservationsScreen extends StatefulWidget {
  const GymReservationsScreen({super.key});

  @override
  State<GymReservationsScreen> createState() => _GymReservationsScreenState();
}

class _GymReservationsScreenState extends State<GymReservationsScreen> {
  @override
  void initState() {
    super.initState();
    _loadReservations();
  }

  void _loadReservations() {
    final userState = context.read<AppUserCubit>().state;
    if (userState.user?.uid != null) {
      context.read<GymReservationsCubit>().fetchUserReservations(userState.user!.uid!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.lightWiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: const CustomeAppBar(),
      ),
      drawer: const CustomDrawer(),
      body: BlocConsumer<GymReservationsCubit, GymReservationsState>(
        listener: (context, state) {
          if (state.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'An error occurred'),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state.isCancelSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Reservation cancelled successfully'),
                backgroundColor: Colors.green,
              ),
            );
          }
          if (state.isUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Reservation updated successfully'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              _loadReservations();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Reservations',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppPallete.blackColor,
                      ),
                    ),
                    verticalSpace(20.h),
                    if (state.isLoading)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    else if (state.reservations == null || state.reservations!.isEmpty)
                      _buildEmptyState()
                    else
                      _buildReservationsList(state.reservations!),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(100.h),
          Icon(
            Icons.event_busy,
            size: 80.sp,
            color: AppPallete.greyColor,
          ),
          verticalSpace(16.h),
          Text(
            'No Reservations Found',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppPallete.greyColor,
            ),
          ),
          verticalSpace(8.h),
          Text(
            'You haven\'t made any gym reservations yet.',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppPallete.greyColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildReservationsList(List reservations) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reservations.length,
      separatorBuilder: (context, index) => verticalSpace(16.h),
      itemBuilder: (context, index) {
        final reservation = reservations[index];
        return ReservationCard(
          reservation: reservation,
          onCancel: () {
            _showCancelDialog(reservation.id);
          },
          onTap: () {
            context.read<GymReservationsCubit>().selectReservation(reservation.id);
            // Navigate to reservation details if needed
          },
        );
      },
    );
  }

  void _showCancelDialog(String reservationId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Reservation'),
          content: const Text('Are you sure you want to cancel this reservation?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<GymReservationsCubit>().cancelReservation(reservationId);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}