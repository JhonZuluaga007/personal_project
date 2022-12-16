part of 'navigation_bar_bloc.dart';

class NavigationBarState {
  int indexNavigation;

  NavigationBarState({this.indexNavigation = 0});

  NavigationBarState copyWith({
    int? indexNavigation,
  }) {
    return NavigationBarState(
      indexNavigation: indexNavigation ?? this.indexNavigation,
    );
  }
}
