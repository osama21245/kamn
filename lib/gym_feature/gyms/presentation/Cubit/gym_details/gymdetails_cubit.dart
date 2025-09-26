import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/features_offer.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:kamn/gym_feature/gyms/data/repo/gym_details_repo.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_state.dart';

@injectable
class GymDetailsCubit extends Cubit<GymDetailsState> {
  final GymDetailsRepository repository;

  GymDetailsCubit({required this.repository})
      : super(GymDetailsState(
          state: GymDetailsStatus.initial,
          selectedFeatures: {},
        ));

  // Future<void> fetchGymDetails(String gymId) async {
  //   emit(state.copyWith(state: GymDetailsStatus.loading));
  //   try {
  //     final gymDetails = await repository.getGymDetails(gymId);
  //     if (gymDetails != null) {
  //       emit(state.copyWith(
  //         state: GymDetailsStatus.success,
  //         gymDetails: gymDetails,
  //       ));
  //     } else {
  //       emit(state.copyWith(
  //         state: GymDetailsStatus.error,
  //         errorMessage: 'Gym not found',
  //       ));
  //     }
  //   } catch (e) {
  //     emit(state.copyWith(
  //       state: GymDetailsStatus.error,
  //       errorMessage: 'Failed to load gym details: $e',
  //     ));
  //   }
  // }

  Future<void> fetchAllGyms() async {
    emit(state.copyWith(state: GymDetailsStatus.loading));
    try {
      final allGyms = await repository.getAllGyms();

      emit(state.copyWith(
        state: GymDetailsStatus.success,
        allGyms: allGyms,
      ));
    } catch (e) {
      log("${e.toString()}");
      emit(state.copyWith(
        state: GymDetailsStatus.error,
        errorMessage: 'Failed to load all gyms: $e',
      ));
    }
  }

  Future<void> getGymFeatures(String gymId) async {
    emit(state.copyWith(state: GymDetailsStatus.featuresLoading));

    final features = await repository.getGymFeatures(gymId);
    features.fold((l) {
      emit(state.copyWith(
        state: GymDetailsStatus.featuresError,
        errorMessage: l.erorr,
      ));
    }, (r) {
      emit(state.copyWith(
        state: GymDetailsStatus.featuresSuccess,
        gymFeatures: r,
      ));
    });
  }

  void toggleFeature(Feature feature) {
    final updatedSelectedFeatures =
        Map<Feature, int>.from(state.selectedFeatures ?? {});

    if (updatedSelectedFeatures.containsKey(feature)) {
      updatedSelectedFeatures.remove(feature);
    } else {
      updatedSelectedFeatures[feature] = 1;
    }

    _emitUpdatedFeatures(updatedSelectedFeatures);
  }

  void increaseQuantity(Feature feature) {
    if (!state.selectedFeatures!.containsKey(feature)) return;

    final updatedSelectedFeatures =
        Map<Feature, int>.from(state.selectedFeatures!);
    updatedSelectedFeatures[feature] =
        (updatedSelectedFeatures[feature] ?? 0) + 1;

    _emitUpdatedFeatures(updatedSelectedFeatures);
  }

  void decreaseQuantity(Feature feature) {
    if (!state.selectedFeatures!.containsKey(feature)) return;

    final updatedSelectedFeatures =
        Map<Feature, int>.from(state.selectedFeatures!);
    final currentQuantity = updatedSelectedFeatures[feature] ?? 0;

    if (currentQuantity > 1) {
      updatedSelectedFeatures[feature] = currentQuantity - 1;
    } else {
      updatedSelectedFeatures.remove(feature);
    }

    _emitUpdatedFeatures(updatedSelectedFeatures);
  }

  void removeFeature(Feature feature) {
    if (!state.selectedFeatures!.containsKey(feature)) return;

    final updatedSelectedFeatures =
        Map<Feature, int>.from(state.selectedFeatures!);
    updatedSelectedFeatures.remove(feature);

    _emitUpdatedFeatures(updatedSelectedFeatures);
  }

  void _emitUpdatedFeatures(Map<Feature, int> features) {
    emit(state.copyWith(
      selectedFeatures: features,
      state: features.isEmpty
          ? GymDetailsStatus.initial
          : GymDetailsStatus.success,
    ));
  }

  int get totalPrice {
    final selectedFeatures = state.selectedFeatures ?? {};
    return selectedFeatures.entries.fold(0, (sum, entry) {
      int price = 0;
      try {
        String priceStr =
            entry.key.price!.trim().replaceAll(RegExp(r'[^\d]'), '');
        price = int.tryParse(priceStr) ?? 0;
      } catch (e) {
        price = 0;
      }
      return sum + (price * entry.value);
    });
  }

  Future<void> getGymPlans(String gymId) async {
    emit(state.copyWith(state: GymDetailsStatus.plansLoading));

    final plans = await repository.getGymPlans(gymId);
    plans.fold((l) {
      emit(state.copyWith(
        state: GymDetailsStatus.plansError,
        errorMessage: l.toString(),
      ));
    }, (r) {
      emit(state.copyWith(
        state: GymDetailsStatus.plansSuccess,
        gymPlans: r,
      ));
    });
  }

  void reset() {
    emit(state.copyWith(
      state: GymDetailsStatus.initial,
      errorMessage: null,
      gymDetails: null,
    ));
  }

  void selectPlan(Plan plan) {
    if (state.selectedPlan?.planId == plan.planId) {
      emit(state.copyWith(selectedPlan: null));
    } else {
      emit(state.copyWith(selectedPlan: plan));
    }
  }

  void clearSelectedPlan() {
    emit(state.copyWith(selectedPlan: null));
  }

  Future<void> getUserById(String userId) async {
    emit(state.copyWith(state: GymDetailsStatus.userLoading));
    try {
      final user = await repository.getUserById(userId);
      user.fold(
        (failure) => emit(state.copyWith(
          state: GymDetailsStatus.userError,
          errorMessage: failure.toString(),
        )),
        (userData) => emit(state.copyWith(
          state: GymDetailsStatus.userSuccess,
          user: userData,
        )),
      );
    } catch (e) {
      emit(state.copyWith(
        state: GymDetailsStatus.error,
        errorMessage: 'Failed to load user: $e',
      ));
    }
  }

  void resetGymOwner() {
    emit(state.copyWith(user: null, reset: true));
  }
}
