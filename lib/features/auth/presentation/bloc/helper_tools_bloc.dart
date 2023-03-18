import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../common_ui/utils/const_list.dart';
import '../../domain/entities/options_tools_entity.dart';
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
                  ethnicities: helperToolsList.data.ethnicities,
                  genders: helperToolsList.data.genders,
                  races: helperToolsList.data.races,
                  riskFactors: helperToolsList.data.riskFactors,
                  schoolLevels: helperToolsList.data.schoolLevels,
                  sexes: helperToolsList.data.sexes,
                  symptoms: helperToolsList.data.symptoms,
                  testResults: helperToolsList.data.testResults,
                  testStatus: helperToolsList.data.testStatus,
                  testTypes: helperToolsList.data.testTypes,
                  testValidities: helperToolsList.data.testValidities,
                  vaccines: helperToolsList.data.vaccines,
                  state: helperToolsList.data.states,
                  answer: ConstLists.dropdownYes,
                ))
              });
    });
  }
}
