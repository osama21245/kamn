// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kamn/core/common/entities/user_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

enum GymDetailsStatus {
  initial,
  loading,
  success,
  error,
  featuresLoading,
  featuresSuccess,
  featuresError,
  plansLoading,
  plansSuccess,
  plansError,
  userLoading,
  userSuccess,
  userError,
}

extension GymDetailsStateX on GymDetailsState {
  bool get isInitial => state == GymDetailsStatus.initial;
  bool get isLoading => state == GymDetailsStatus.loading;
  bool get isSuccess => state == GymDetailsStatus.success;
  bool get isError => state == GymDetailsStatus.error;
  bool get isFeaturesLoading => state == GymDetailsStatus.featuresLoading;
  bool get isFeaturesSuccess => state == GymDetailsStatus.featuresSuccess;
  bool get isFeaturesError => state == GymDetailsStatus.featuresError;
  bool get plansLoading => state == GymDetailsStatus.plansLoading;
  bool get plansSuccess => state == GymDetailsStatus.plansSuccess;
  bool get plansError => state == GymDetailsStatus.plansError;
  bool get userLoading => state == GymDetailsStatus.userLoading;
  bool get userSuccess => state == GymDetailsStatus.userSuccess;
  bool get userError => state == GymDetailsStatus.userError;
}

class GymDetailsState {
  final GymDetailsStatus state;
  final String? errorMessage;
  final GymModel? gymDetails;
  final List<GymModel>? allGyms;
  final List<Feature>? gymFeatures;
  final List<Plan>? gymPlans;
  final Map<Feature, int>? selectedFeatures;
  final Plan? selectedPlan;
  final UserModel? user;

  GymDetailsState(
      {required this.state,
      this.errorMessage,
      this.gymDetails,
      this.allGyms,
      this.gymFeatures,
      this.gymPlans,
      this.user,
      this.selectedFeatures,
      this.selectedPlan});

      
  GymDetailsState copyWith({
    GymDetailsStatus? state,
    String? errorMessage,
    GymModel? gymDetails,
    List<GymModel>? allGyms,
    List<Feature>? gymFeatures,
    List<Plan>? gymPlans,
    Map<Feature, int>? selectedFeatures,
    Plan? selectedPlan,
    UserModel? user,
    bool reset = false,
  }) {
    return GymDetailsState(
      state: state ?? this.state,
      errorMessage: reset && errorMessage != null
          ? null
          : errorMessage ?? this.errorMessage,
      gymDetails:
          reset && gymDetails != null ? null : gymDetails ?? this.gymDetails,
      allGyms: reset && allGyms != null ? null : allGyms ?? this.allGyms,
      gymFeatures:
          reset && gymFeatures != null ? null : gymFeatures ?? this.gymFeatures,
      gymPlans: reset && gymPlans != null ? null : gymPlans ?? this.gymPlans,
      selectedFeatures: reset && selectedFeatures != null
          ? null
          : selectedFeatures ?? this.selectedFeatures,
      selectedPlan: reset && selectedPlan != null
          ? null
          : selectedPlan ?? this.selectedPlan,
      user: reset && user != null ? null : user ?? this.user,
    );
  }

  @override
  String toString() {
    return 'GymDetailsState(state: $state, errorMessage: $errorMessage, gymDetails: $gymDetails, allGyms: $allGyms, gymFeatures: $gymFeatures, gymPlans: $gymPlans, selectedFeatures: $selectedFeatures, selectedPlan: $selectedPlan, user: $user)';
  }
}
