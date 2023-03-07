import 'package:Tellme/features/auth/domain/entities/helper_tools_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../config/helpers/injector/injector.dart';
import '../../domain/use_cases/helper_tools_use_cases.dart';

part 'helper_tools_event.dart';
part 'helper_tools_state.dart';

class HelperToolsBloc extends Bloc<HelperToolsEvent, HelperToolsState> {
  HelperToolsBloc() : super(const HelperToolsState()) {
    final helperToolsUseCases = Injector.resolve<HelperToolsUseCases>();
    on<GetTestTools>((event, emit) async {
      final helperTools = await helperToolsUseCases.call();
      helperTools.fold(
          (left) => {},
          (helperToolsList) => {
                emit(state.copyWith(
                  opEthnicity: helperToolsList.data.opEthnicity,
                  opGender: helperToolsList.data.opGender,
                  opLaboratory: helperToolsList.data.opLaboratory,
                  opManufacturer: helperToolsList.data.opManufacturer,
                  opRace: helperToolsList.data.opRace,
                  opRoles: helperToolsList.data.opRoles,
                  opSex: helperToolsList.data.opSex,
                  opSwabType: helperToolsList.data.opSwabType,
                  opTestType: helperToolsList.data.opTestType,
                ))
              });
    });
  }
}
