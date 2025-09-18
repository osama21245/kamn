class BottomNavBarState {
  final int currentIndex;

  BottomNavBarState({required this.currentIndex});

  BottomNavBarState copyWith({int? currentIndex}) {
    return BottomNavBarState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
