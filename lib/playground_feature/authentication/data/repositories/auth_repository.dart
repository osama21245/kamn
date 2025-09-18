import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/helpers/secure_storage_helper.dart';
import 'package:kamn/playground_feature/authentication/presentation/cubits/sign_in_cubit/sign_in_view_model.dart';
import '../../../../core/erorr/faliure.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../../../../core/common/entities/user_model.dart';
import '../data_source/auth_remote_data_source.dart';

abstract interface class AuthRepository {
  Future<Either<Faliure, UserModel>> signUp({
    required String email,
    required String password,
    required String name,
    required String type,
  });
  Future<Either<Faliure, void>> sendVerificationEmail();
  Future<Either<Faliure, void>> setUser({required UserModel userModel});
  Future<Either<Faliure, void>> deleteUser({required String uid});
  Future<Either<Faliure, String>> signIn(
      {required String email, required String password});
  Future<Either<Faliure, UserModel>> getUser({required String uid});
  Future<Either<Faliure, void>> signOut();
  Future<Either<Faliure, void>> googleSignOut();
  Future<Either<Faliure, UserModel>> googleAuth();
  Future<Either<Faliure, bool>> checkUesrSignin();
  Future<Either<Faliure, void>> updateUser(String uid,Map<String, dynamic> data);

}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authDataSource})
      : _authDataSource = authDataSource;

  @override
  Future<Either<Faliure, UserModel>> signUp({
    required String email,
    required String password,
    required String name,
    required String type,
  }) async {
    return await executeTryAndCatchForRepository(() async {
      final userCredential = await _authDataSource.signUp(
        email: email,
        password: password,
        name: name,
      );
      final interestedList=await SecureStorageHelper.getInterestedList();
      final userModel = UserModel(
          signFrom: SignInMethods.emailAndPassword.name,
          uid: userCredential.user!.uid,
          profileImage: userCredential.user?.photoURL ,
          phoneNumber: userCredential.user?.phoneNumber ,
          email: email,
          name: name,
          createdAt: DateTime.now(),
          interestedList:interestedList ,
          type: type);

      return userModel;
    });
  }

  @override
  Future<Either<Faliure, void>> sendVerificationEmail() async {
    return await executeTryAndCatchForRepository(() async {
      await _authDataSource.sendVerificationEmail();
    });
  }

  @override
  Future<Either<Faliure, void>> setUser({required UserModel userModel}) async {
    return await executeTryAndCatchForRepository(() async {
      await _authDataSource.setUser(userModel: userModel);
    });
  }

  @override
  Future<Either<Faliure, void>> deleteUser({required String uid}) async {
    return await executeTryAndCatchForRepository(() async {
      await _authDataSource.deleteUser(uid: uid);
    });
  }

  @override
  Future<Either<Faliure, String>> signIn(
      {required String email, required String password}) async {
    return executeTryAndCatchForRepository(() async {
      final userCredential =
          await _authDataSource.signIn(email: email, password: password);
      return userCredential.user!.uid;
    });
  }

  @override
  Future<Either<Faliure, UserModel>> getUser({required String uid}) async {
    return executeTryAndCatchForRepository(() async {
      final userData = await _authDataSource.getUserData(uid: uid);
      return UserModel.fromMap(userData!);
    });
  }

  @override
  Future<Either<Faliure, void>> signOut() async {
    return await executeTryAndCatchForRepository(() async {
      await _authDataSource.signOut();
    });
  }

  @override
  Future<Either<Faliure, UserModel>> googleAuth() async {
    return await executeTryAndCatchForRepository(() async {
      final userCredential = await _authDataSource.googleAuth();
      final user =
          await _authDataSource.getUserData(uid: userCredential.user!.uid);
      if (user != null) {
        return UserModel.fromMap(user);
      } else {
        return UserModel(
            signFrom: SignInMethods.google.name,
            type: 'normal',
            profileImage: userCredential.user?.photoURL,
            phoneNumber: userCredential.user?.phoneNumber ,
            uid: userCredential.user!.uid,
            email: userCredential.user!.email!,
            name: userCredential.user!.displayName!,
            createdAt: DateTime.now());
      }
    });
  }

  @override
  Future<Either<Faliure, void>> googleSignOut() async {
    return await executeTryAndCatchForRepository(() async {
      await _authDataSource.googleSignOut();
    });
  }

  @override
  Future<Either<Faliure, bool>> checkUesrSignin() async {
    return await executeTryAndCatchForRepository(() async {
      return await _authDataSource.checkUesrSignin();
    });
  }
  
  @override
  Future<Either<Faliure, void>> updateUser(String uid, Map<String, dynamic> data)async {
  return await executeTryAndCatchForRepository(() async {
      return await _authDataSource.updateUser(uid, data);
    });
  }
}
