import 'package:kamn/core/common/entities/user_model.dart';

sealed class GetUserState {}

class GetUserStateInit extends GetUserState {}
class GetUserStateLoading extends GetUserState {}
class GetUserSuccessState extends GetUserState {
  final UserModel userModel;

  GetUserSuccessState(this.userModel);
}
class GetUserErrorState extends GetUserState {
  final String error;

  GetUserErrorState(this.error);
}