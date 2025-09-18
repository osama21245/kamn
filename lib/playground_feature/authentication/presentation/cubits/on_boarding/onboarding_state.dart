
enum OnBoardingStatus {
  initial,
  loading,
  success,
  error,
}
extension OnBoardingStatusExtension on OnBoardingState {
  bool get isInitial => status == OnBoardingStatus.initial;
  bool get isLoading => status == OnBoardingStatus.loading;
  bool get isSuccess => status == OnBoardingStatus.success;
  bool get isError => status == OnBoardingStatus.error;
}

class OnBoardingState  {
  final List<String> selectedInterests;
  final Map<String, bool> selectionState;
  final OnBoardingStatus status;
  final String? errorMessage;

  const OnBoardingState({
    required this.selectedInterests,
    required this.selectionState,
    required this.status,
    this.errorMessage,
  });

  factory OnBoardingState.initial() {
    return const OnBoardingState(
      selectedInterests: [],
      selectionState: {
        "Healthy Food Plan": false,
        "Playground Courts": false,
        "Gym Booking": false,
      },
      status: OnBoardingStatus.initial,
    );
  }

  OnBoardingState copyWith({
    List<String>? selectedInterests,
    Map<String, bool>? selectionState,
    OnBoardingStatus? status,
    String? errorMessage,
  }) {
    return OnBoardingState(
      selectedInterests: selectedInterests ?? this.selectedInterests,
      selectionState: selectionState ?? this.selectionState,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  
}