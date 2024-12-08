// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/admin/data/data_source/analytics_data_source.dart'
    as _i418;
import '../../features/admin/data/data_source/second_page_data_source.dart'
    as _i746;
import '../../features/admin/data/repository/analytics_repository.dart'
    as _i724;
import '../../features/admin/data/repository/second_page_repository.dart'
    as _i173;
import '../../features/admin/domain/use_case/second_page_use_case.dart'
    as _i396;
import '../../features/admin/presentation/cubits/first_page_cupit/analytics_cubit.dart'
    as _i209;
import '../../features/admin/presentation/cubits/second_page_cubit/second_page_cubit.dart'
    as _i608;
import '../../features/payment/presentation/cubits/payment_options_cubit/payment_options_view_model.dart'
    as _i805;
import '../../features/sports/data/data_source/sports_remote_data_source.dart'
    as _i575;
import '../../features/sports/data/repositories/sports_repository.dart'
    as _i379;
import '../../features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart'
    as _i137;
import '../../features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart'
    as _i1033;
import '../../features/sports_service_providers/data/data_source/service_providers_remote_data_source.dart'
    as _i1047;
import '../../features/sports_service_providers/data/repository/service_providers_repository.dart'
    as _i542;
import '../../features/sports_service_providers/domain/usecase/get_services_from_firebase_usecase.dart'
    as _i786;
import '../../features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_cubit.dart'
    as _i252;
import '../../features/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart'
    as _i731;
import '../../features/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_cubit.dart'
    as _i773;
import '../../features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_cubit.dart'
    as _i692;
import '../../features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart'
    as _i987;
import '../common/class/firebase_storage_services.dart' as _i304;
import '../common/class/firestore_services.dart' as _i158;

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
    gh.factory<_i805.PaymentOptionsViewModel>(
        () => _i805.PaymentOptionsViewModel());
    gh.lazySingleton<_i304.FirebaseStorageServices>(
        () => _i304.FirebaseStorageServices());
    gh.lazySingleton<_i158.FirestoreService>(() => _i158.FirestoreService());
    gh.factory<_i746.SecondPageDataSource>(() => _i746.SecondPageDataSourceImpl(
        firestore: gh<_i158.FirestoreService>()));
    gh.factory<_i418.AnalyticsDataSource>(() => _i418.AnalyticsDataSourceImpl(
          firestoreServices: gh<_i158.FirestoreService>(),
          storageServies: gh<_i304.FirebaseStorageServices>(),
        ));
    gh.factory<_i1047.ServiceProvidersRemoteDataSource>(
        () => _i1047.ServiceProvidersRemoteDataSourceImpl(
              firestoreServices: gh<_i158.FirestoreService>(),
              storageServies: gh<_i304.FirebaseStorageServices>(),
            ));
    gh.factory<_i173.SecondPageRepository>(() => _i173.SecondPageRepositoryImpl(
        secondPageDataSource: gh<_i746.SecondPageDataSource>()));
    gh.factory<_i542.ServiceProvidersRepository>(() =>
        _i542.ServiceProvidersRepositoryImpl(
            dataSource: gh<_i1047.ServiceProvidersRemoteDataSource>()));
    gh.factory<_i396.SecondPageUseCase>(() => _i396.SecondPageUseCaseImpl(
        repository: gh<_i173.SecondPageRepository>()));
    gh.factory<_i724.AnalyticsRepository>(() => _i724.AnalyticsRepositoryImpl(
        dataSource: gh<_i418.AnalyticsDataSource>()));
    gh.factory<_i608.SecondPageCubit>(() => _i608.SecondPageCubit(
          repository: gh<_i173.SecondPageRepository>(),
          dataFilter: gh<_i396.SecondPageUseCase>(),
        ));
    gh.factory<_i209.AnalyticsCubit>(() =>
        _i209.AnalyticsCubit(repository: gh<_i724.AnalyticsRepository>()));
    gh.factory<_i575.SportsRemoteDataSource>(() =>
        _i575.SportsRemoteDataSourceImpl(
            firestoreService: gh<_i158.FirestoreService>()));
    gh.factory<_i786.GetServicesFromFirebaseUsecase>(() =>
        _i786.GetServicesFromFirebaseUsecase(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i252.AddServiceProviderCubit>(() =>
        _i252.AddServiceProviderCubit(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i731.AvailableDatesCubit>(() => _i731.AvailableDatesCubit(
        repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i773.EditServiceProviderCubit>(() =>
        _i773.EditServiceProviderCubit(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i692.ServiceProviderGroundDetailsCubit>(() =>
        _i692.ServiceProviderGroundDetailsCubit(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i379.SportsRepository>(() => _i379.SportsRepositoryImpl(
        remoteDataSource: gh<_i575.SportsRemoteDataSource>()));
    gh.factory<_i137.PickTimeForReservationCubit>(() =>
        _i137.PickTimeForReservationCubit(
            repository: gh<_i379.SportsRepository>()));
    gh.factory<_i1033.SportsGroundsCubit>(() => _i1033.SportsGroundsCubit(
        sportsRepository: gh<_i379.SportsRepository>()));
    gh.factory<_i987.ServiceProviderGroundsCubit>(() =>
        _i987.ServiceProviderGroundsCubit(
            getPlaygroundUsecase: gh<_i786.GetServicesFromFirebaseUsecase>()));
    return this;
  }
}
