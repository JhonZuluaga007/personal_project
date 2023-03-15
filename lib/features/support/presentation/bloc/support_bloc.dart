import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../config/helpers/injector/injector.dart';
import '../../domain/use_cases/create_ticket_use_case.dart';
import '../../../../config/helpers/form_submission_status.dart';

part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(SupportState()) {
    final createSupportTicketUseCase =
        Injector.resolve<CreateSupportTicketUseCase>();
    on<CreateSupportTicketEvent>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final createSupportTicketResponse = await createSupportTicketUseCase.call(
          event.name,
          event.email,
          event.phone,
          event.description,
          event.image!);
      createSupportTicketResponse.fold(
          (error) => emit(state.copyWith(
                formStatus:
                    SubmissionFailed(exception: Exception(error.message)),
              )),
          (supportSuccess) =>
              emit(state.copyWith(formStatus: SubmissionSuccess())));
    });
  }
}
