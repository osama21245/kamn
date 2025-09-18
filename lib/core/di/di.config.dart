// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../gym_feature/add_gym/data/datasources/add_gym_remote_data_source.dart'
    as _i126;
import '../../gym_feature/add_gym/data/repositories/add_gym_repository.dart'
    as _i573;
import '../../gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart'
    as _i1045;
import '../../gym_feature/add_gym/presentation/cubits/create_gym_feature/create_gym_feature_cubit.dart'
    as _i749;
import '../../gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart'
    as _i429;
import '../../gym_feature/add_gym/presentation/cubits/track_submission/track_submission_cubit.dart'
    as _i667;
import '../../gym_feature/gyms/data/datasources/gym_remote_data_source.dart'
    as _i906;
import '../../gym_feature/gyms/data/repo/gym_details_repo.dart' as _i1060;
import '../../gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart'
    as _i1027;
import '../../main/presentation/cubit/bottom_nav_bar_cubit.dart' as _i1042;
import '../../playground_feature/admin/data/data_source/analytics_data_source.dart'
    as _i366;
import '../../playground_feature/admin/data/data_source/second_page_data_source.dart'
    as _i4;
import '../../playground_feature/admin/data/repository/analytics_repository.dart'
    as _i130;
import '../../playground_feature/admin/data/repository/second_page_repository.dart'
    as _i317;
import '../../playground_feature/admin/domain/use_case/second_page_use_case.dart'
    as _i582;
import '../../playground_feature/admin/presentation/cubits/first_page_cupit/analytics_cubit.dart'
    as _i14;
import '../../playground_feature/admin/presentation/cubits/second_page_cubit/second_page_cubit.dart'
    as _i224;
import '../../playground_feature/authentication/data/data_source/auth_remote_data_source.dart'
    as _i774;
import '../../playground_feature/authentication/data/repositories/auth_repository.dart'
    as _i307;
import '../../playground_feature/authentication/presentation/cubits/on_boarding/onboarding_cubit.dart'
    as _i1042;
import '../../playground_feature/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart'
    as _i529;
import '../../playground_feature/authentication/presentation/cubits/sign_in_cubit/sign_in_view_model.dart'
    as _i89;
import '../../playground_feature/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart'
    as _i672;
import '../../playground_feature/authentication/presentation/cubits/sign_up_cubit/sign_up_view_model.dart'
    as _i505;
import '../../playground_feature/payment/presentation/cubits/payment_options_cubit/payment_options_view_model.dart'
    as _i557;
import '../../playground_feature/payment/presentation/cubits/procced_payment_cubit/procced_payment_cubit.dart'
    as _i827;
import '../../playground_feature/sports/data/data_source/sports_remote_data_source.dart'
    as _i382;
import '../../playground_feature/sports/data/repositories/sports_repository.dart'
    as _i201;
import '../../playground_feature/sports/domain/usecase/get_sports_from_firebase_usecase.dart'
    as _i870;
import '../../playground_feature/sports/domain/usecase/sports_ground_usecase.dart'
    as _i405;
import '../../playground_feature/sports/presentation/cubits/ground_details_cubit/ground_details_cubit.dart'
    as _i697;
import '../../playground_feature/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart'
    as _i767;
import '../../playground_feature/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_view_model.dart'
    as _i40;
import '../../playground_feature/sports/presentation/cubits/reservation_details_cubit/reservation_details_cubit.dart'
    as _i645;
import '../../playground_feature/sports/presentation/cubits/select_category_cubit/select_category_cubit.dart'
    as _i915;
import '../../playground_feature/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart'
    as _i262;
import '../../playground_feature/sports/presentation/cubits/sports_grounds/sports_ground_view_model.dart'
    as _i174;
import '../../playground_feature/sports/presentation/cubits/view_reservation/view_reservation_cubit.dart'
    as _i1055;
import '../../playground_feature/sports_service_providers/data/data_source/service_providers_remote_data_source.dart'
    as _i348;
import '../../playground_feature/sports_service_providers/data/repository/service_providers_repository.dart'
    as _i231;
import '../../playground_feature/sports_service_providers/domain/usecase/filter_search_data_use_case.dart'
    as _i321;
import '../../playground_feature/sports_service_providers/domain/usecase/get_services_from_firebase_usecase.dart'
    as _i447;
import '../../playground_feature/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_cubit.dart'
    as _i519;
import '../../playground_feature/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart'
    as _i451;
import '../../playground_feature/sports_service_providers/presentation/cubit/current_reseravaion_order/current_orders_cubit.dart'
    as _i369;
import '../../playground_feature/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_cubit.dart'
    as _i566;
import '../../playground_feature/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_cubit.dart'
    as _i1038;
import '../../playground_feature/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_cubit.dart'
    as _i632;
import '../../playground_feature/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart'
    as _i616;
import '../../playground_feature/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_cubit.dart'
    as _i18;
import '../../playground_feature/sports_service_providers/presentation/cubit/track_ground_reservations/track_ground_reservations_cubit.dart'
    as _i725;
import '../../playground_feature/user/data/data_source/user_remote_data_source.dart'
    as _i680;
import '../../playground_feature/user/data/repository/user_repository.dart'
    as _i609;
import '../../playground_feature/user/presentation/cubit/edit_profile/edit_profile_cubit.dart'
    as _i798;
import '../../playground_feature/user/presentation/cubit/notification/notifications_cubit.dart'
    as _i113;
import '../common/class/firebase_storage_services.dart' as _i304;
import '../common/class/firestore_services.dart' as _i158;
import '../common/cubit/app_user/app_user_cubit.dart' as _i94;
import '../common/cubit/firebase_remote_config/firebase_remote_config_cubit.dart'
    as _i654;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i89.SignInViewModel>(() => _i89.SignInViewModel());
    gh.factory<_i505.SignUpViewModel>(() => _i505.SignUpViewModel());
    gh.factory<_i557.PaymentOptionsViewModel>(
        () => _i557.PaymentOptionsViewModel());
    gh.factory<_i405.SportsGroundUsecase>(() => _i405.SportsGroundUsecase());
    gh.factory<_i697.GroundDetailsCubit>(() => _i697.GroundDetailsCubit());
    gh.factory<_i40.PickTimeForReservationViewModel>(
        () => _i40.PickTimeForReservationViewModel());
    gh.factory<_i174.SportsGroundViewModel>(
        () => _i174.SportsGroundViewModel());
    gh.factory<_i1042.OnboardingCubit>(() => _i1042.OnboardingCubit());
    gh.factory<_i1042.BottomNavBarCubit>(() => _i1042.BottomNavBarCubit());
    gh.lazySingleton<_i304.FirebaseStorageServices>(
        () => _i304.FirebaseStorageServices());
    gh.lazySingleton<_i158.FirestoreService>(() => _i158.FirestoreService());
    gh.factory<_i774.AuthRemoteDataSource>(() => _i774.AuthRemoteDataSourceImpl(
        firestore: gh<_i158.FirestoreService>()));
    gh.factory<_i366.AnalyticsDataSource>(() => _i366.AnalyticsDataSourceImpl(
          firestoreServices: gh<_i158.FirestoreService>(),
          storageServies: gh<_i304.FirebaseStorageServices>(),
        ));
    gh.factory<_i654.FirebaseRemoteConfigCubit>(() =>
        _i654.FirebaseRemoteConfigCubit(
            remoteConfig: gh<_i627.FirebaseRemoteConfig>()));
    gh.factory<_i348.ServiceProvidersRemoteDataSource>(
        () => _i348.ServiceProvidersRemoteDataSourceImpl(
              firestoreServices: gh<_i158.FirestoreService>(),
              storageServies: gh<_i304.FirebaseStorageServices>(),
            ));
    gh.factory<_i307.AuthRepository>(() => _i307.AuthRepositoryImpl(
        authDataSource: gh<_i774.AuthRemoteDataSource>()));
    gh.factory<_i906.GymDetailsRemoteDataSource>(
        () => _i906.GymDetailsRemoteDataSourceImpl());
    gh.factory<_i130.AnalyticsRepository>(() => _i130.AnalyticsRepositoryImpl(
        dataSource: gh<_i366.AnalyticsDataSource>()));
    gh.factory<_i126.AddGymRemoteDataSource>(
        () => _i126.AddGymRemoteDataSourceImpl());
    gh.factory<_i4.SecondPageDataSource>(() =>
        _i4.SecondPageDataSourceImpl(firestore: gh<_i158.FirestoreService>()));
    gh.factory<_i1060.GymDetailsRepository>(() =>
        _i1060.GymDetailsRepositoryImpl(
            gh<_i906.GymDetailsRemoteDataSource>()));
    gh.factory<_i680.UserRemoteDataSource>(() => _i680.UserRemoteDataSourceImpl(
        firestoreService: gh<_i158.FirestoreService>()));
    gh.factory<_i317.SecondPageRepository>(() => _i317.SecondPageRepositoryImpl(
        secondPageDataSource: gh<_i4.SecondPageDataSource>()));
    gh.factory<_i529.SignInCubit>(() => _i529.SignInCubit(
          authRepository: gh<_i307.AuthRepository>(),
          signInViewModel: gh<_i89.SignInViewModel>(),
        ));
    gh.factory<_i1027.GymDetailsCubit>(() =>
        _i1027.GymDetailsCubit(repository: gh<_i1060.GymDetailsRepository>()));
    gh.factory<_i231.ServiceProvidersRepository>(() =>
        _i231.ServiceProvidersRepositoryImpl(
            dataSource: gh<_i348.ServiceProvidersRemoteDataSource>()));
    gh.factory<_i382.SportsRemoteDataSource>(() =>
        _i382.SportsRemoteDataSourceImpl(
            firestoreService: gh<_i158.FirestoreService>()));
    gh.factory<_i94.AppUserCubit>(
        () => _i94.AppUserCubit(authRepository: gh<_i307.AuthRepository>()));
    gh.factory<_i14.AnalyticsCubit>(
        () => _i14.AnalyticsCubit(repository: gh<_i130.AnalyticsRepository>()));
    gh.factory<_i672.SignUpCubit>(() => _i672.SignUpCubit(
          authRepository: gh<_i307.AuthRepository>(),
          signUpViewModel: gh<_i505.SignUpViewModel>(),
        ));
    gh.factory<_i321.FilterSearchDataUseCase>(() =>
        _i321.FilterSearchDataUseCase(
            repository: gh<_i231.ServiceProvidersRepository>()));
    gh.factory<_i447.GetServicesFromFirebaseUsecase>(() =>
        _i447.GetServicesFromFirebaseUsecase(
            repository: gh<_i231.ServiceProvidersRepository>()));
    gh.factory<_i519.AddServiceProviderCubit>(() =>
        _i519.AddServiceProviderCubit(
            repository: gh<_i231.ServiceProvidersRepository>()));
    gh.factory<_i451.AvailableDatesCubit>(() => _i451.AvailableDatesCubit(
        repository: gh<_i231.ServiceProvidersRepository>()));
    gh.factory<_i369.CurrentOrdersCubit>(() => _i369.CurrentOrdersCubit(
        repository: gh<_i231.ServiceProvidersRepository>()));
    gh.factory<_i566.EditServiceProviderCubit>(() =>
        _i566.EditServiceProviderCubit(
            repository: gh<_i231.ServiceProvidersRepository>()));
    gh.factory<_i1038.FinishedOrdersCubit>(() => _i1038.FinishedOrdersCubit(
        repository: gh<_i231.ServiceProvidersRepository>()));
    gh.factory<_i632.ServiceProviderGroundDetailsCubit>(() =>
        _i632.ServiceProviderGroundDetailsCubit(
            repository: gh<_i231.ServiceProvidersRepository>()));
    gh.factory<_i725.TrackGroundReservationsCubit>(() =>
        _i725.TrackGroundReservationsCubit(
            repository: gh<_i231.ServiceProvidersRepository>()));
    gh.factory<_i18.TrackGroundReservationsDetailsCubit>(() =>
        _i18.TrackGroundReservationsDetailsCubit(
            repository: gh<_i231.ServiceProvidersRepository>()));
    gh.factory<_i609.UserRepository>(() => _i609.UserRepositoryImpl(
        userRemoteDataSource: gh<_i680.UserRemoteDataSource>()));
    gh.factory<_i573.AddGymRepository>(() => _i573.AddGymRepositoryImpl(
        dataSource: gh<_i126.AddGymRemoteDataSource>()));
    gh.factory<_i201.SportsRepository>(() => _i201.SportsRepositoryImpl(
        remoteDataSource: gh<_i382.SportsRemoteDataSource>()));
    gh.factory<_i1045.AddGymCubit>(
        () => _i1045.AddGymCubit(repository: gh<_i573.AddGymRepository>()));
    gh.factory<_i749.CreateGymFeatureCubit>(() =>
        _i749.CreateGymFeatureCubit(repository: gh<_i573.AddGymRepository>()));
    gh.factory<_i429.MembershipOfferCubit>(() =>
        _i429.MembershipOfferCubit(repository: gh<_i573.AddGymRepository>()));
    gh.factory<_i667.TrackSubmissionCubit>(() =>
        _i667.TrackSubmissionCubit(repository: gh<_i573.AddGymRepository>()));
    gh.factory<_i616.ServiceProviderGroundsCubit>(
        () => _i616.ServiceProviderGroundsCubit(
              getPlaygroundUsecase: gh<_i447.GetServicesFromFirebaseUsecase>(),
              searchDataUseCase: gh<_i321.FilterSearchDataUseCase>(),
            ));
    gh.factory<_i113.NotificationsCubit>(() =>
        _i113.NotificationsCubit(userRepository: gh<_i609.UserRepository>()));
    gh.factory<_i827.ProccedPaymentCubit>(() => _i827.ProccedPaymentCubit(
        sportsRepository: gh<_i201.SportsRepository>()));
    gh.factory<_i1055.ViewReservationCubit>(() => _i1055.ViewReservationCubit(
        sportsRepository: gh<_i201.SportsRepository>()));
    gh.factory<_i582.SecondPageUseCase>(() => _i582.SecondPageUseCaseImpl(
        repository: gh<_i317.SecondPageRepository>()));
    gh.factory<_i798.EditProfileCubit>(
        () => _i798.EditProfileCubit(repository: gh<_i609.UserRepository>()));
    gh.factory<_i767.PickTimeForReservationCubit>(
        () => _i767.PickTimeForReservationCubit(
              repository: gh<_i201.SportsRepository>(),
              viewModel: gh<_i40.PickTimeForReservationViewModel>(),
            ));
    gh.factory<_i870.GetPlaygroundsAndFlittered>(() =>
        _i870.GetPlaygroundsAndFlittered(
            repository: gh<_i201.SportsRepository>()));
    gh.factory<_i645.ReservationDetailsCubit>(() =>
        _i645.ReservationDetailsCubit(
            repository: gh<_i201.SportsRepository>()));
    gh.factory<_i915.SelectCategoryCubit>(() => _i915.SelectCategoryCubit(
        getPlaygrouundsUseCase: gh<_i870.GetPlaygroundsAndFlittered>()));
    gh.factory<_i224.SecondPageCubit>(() => _i224.SecondPageCubit(
          repository: gh<_i317.SecondPageRepository>(),
          dataFilter: gh<_i582.SecondPageUseCase>(),
        ));
    gh.factory<_i262.SportsGroundsCubit>(() => _i262.SportsGroundsCubit(
          sportsRepository: gh<_i201.SportsRepository>(),
          sportsGroundUsecase: gh<_i405.SportsGroundUsecase>(),
          getPlaygrouundsUseCase: gh<_i870.GetPlaygroundsAndFlittered>(),
          sportsGroundViewModel: gh<_i174.SportsGroundViewModel>(),
        ));
    return this;
  }
}
