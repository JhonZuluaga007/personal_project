import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pcr_event.dart';
part 'pcr_state.dart';

class PcrBloc extends Bloc<PcrEvent, PcrState> {
  PcrBloc() : super(PcrInitial()) {
    on<PcrEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
