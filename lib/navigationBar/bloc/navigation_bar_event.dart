part of 'navigation_bar_bloc.dart';

abstract class NavigationBarEvent {}

class PageChanged extends NavigationBarEvent {
  PageChanged({
    required this.indexNavigation,
  });

  final int indexNavigation;
}

class ReinitializeNavigationBar extends NavigationBarEvent {}
