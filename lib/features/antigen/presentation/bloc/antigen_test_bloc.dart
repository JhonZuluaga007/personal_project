import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'antigen_test_event.dart';
part 'antigen_test_state.dart';

class AntigenTestBloc extends Bloc<AntigenTestEvent, AntigenTestState> {
  AntigenTestBloc() : super(AntigenTestInitial()) {
    on<AntigenTestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
