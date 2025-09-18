import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/helpers/secure_storage_helper.dart';
import 'package:kamn/playground_feature/authentication/presentation/cubits/on_boarding/onboarding_state.dart';
@injectable
class OnboardingCubit extends Cubit<OnBoardingState> {
  OnboardingCubit() : super(OnBoardingState.initial());

  void toggleInterestSelection(String title) {
    final currentSelectionState = Map<String, bool>.from(state.selectionState);
    final currentSelectedInterests = List<String>.from(state.selectedInterests);

    // Toggle selection state
    currentSelectionState[title] = !currentSelectionState[title]!;

    // Update selected interests list
    if (currentSelectionState[title]!) {
      if (!currentSelectedInterests.contains(title)) {
        currentSelectedInterests.add(title);
      }
    } else {
      currentSelectedInterests.remove(title);
    }

    emit(state.copyWith(
      selectionState: currentSelectionState,
      selectedInterests: currentSelectedInterests,
    ));
  }

  Future<void> saveSelectedInterests() async {
    try {
      emit(state.copyWith(status: OnBoardingStatus.loading));
      
      await SecureStorageHelper.saveInterestedList(state.selectedInterests);
      
      emit(state.copyWith(status: OnBoardingStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: OnBoardingStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}