part of 'helper_tools_bloc.dart';

@immutable
abstract class HelperToolsEvent {}

class GetTestTools extends HelperToolsEvent {
  GetTestTools();
}
