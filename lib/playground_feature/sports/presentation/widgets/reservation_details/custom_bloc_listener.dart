import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/utils/alert_dialog_utils.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/reservation_details_cubit/reservation_details_cubit.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/reservation_details_cubit/reservation_details_state.dart';

class CustomBlocListener extends StatelessWidget {
  const CustomBlocListener({super.key, required this.child, required this.reservation});
  final Widget child;
  final ReservationModel reservation;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ReservationDetailsCubit, ReservationDetailsState>(
      listener: (context, state) {
        if(state.isTimeExcessed){
          AlertDialogUtils.showAlert(context: context,title:'Cancellation Window Expired' , content: "The cancellation window has expired. If you still wish to cancel, a cancellation fee will apply.",firstbutton: 'close',secondbutton: 'contiune',secondAction: 
          (){
            var user = context.read<AppUserCubit>().state.user;
user=user?.copyWith(spamer:true)       ;     //TODO : need to handle with transcation call back 
            context.read<AppUserCubit>().updateUser(user!, {"spamer":true});
            context.read<ReservationDetailsCubit>().deleteReservation(reservation);
          }
          );
        }
        if(state.isDeleted){
          showSnackBar(context,'Reservation deleted successfully');
           Navigator.pushReplacementNamed(
                        context, Routes.myProfileScreen);
        }
      },
      child: child,
    );
    
    }}