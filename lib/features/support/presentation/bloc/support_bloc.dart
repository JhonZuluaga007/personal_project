import 'package:Tellme/config/helpers/form_submission_status.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(SupportState()) {
    on<CreateSupportTicketEvent>((event, emit) {
      emit(state.copyWith(formStatus: FormSubmitting()));
    });
  }
}
