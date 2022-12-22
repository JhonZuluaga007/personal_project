import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(NavigationBarState()) {
    on<NavigationBarEvent>((event, emit) {
      on<PageChanged>(_changeIndex);
      on<ReinitializeNavigationBar>(_reinitializeBar);
    });
  }

  void _changeIndex(PageChanged event, Emitter<NavigationBarState> emit) async {
    emit(
      state.copyWith(indexNavigation: event.indexNavigation),
    );
  }

  void _reinitializeBar(
      ReinitializeNavigationBar event, Emitter<NavigationBarState> emit) {
    emit(
      state.copyWith(
        indexNavigation: 0,
      ),
    );
  }

}
