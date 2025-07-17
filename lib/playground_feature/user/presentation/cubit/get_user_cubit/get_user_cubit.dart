import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/common/entities/user_model.dart';
import 'package:kamn/playground_feature/user/data/repository/user_repository.dart';

import 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState>{
  final UserRepository repository ;
  GetUserCubit(this.repository) : super (GetUserStateInit());

  void getUserData (uid) async {
    emit(GetUserStateLoading());
    var result =await repository.getUsersInfo(uid);
    result.fold(
        (e) {
          print("============>Error : ${e.toString()}");
          emit(GetUserErrorState(e.toString()));
          return e.toString();
        },
        (user) {
          emit(GetUserSuccessState(user));
          return user;
        }
    );
  }

}