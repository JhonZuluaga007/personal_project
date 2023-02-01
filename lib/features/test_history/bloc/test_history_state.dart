part of 'test_history_bloc.dart';

@immutable
class TestHistoryState {
  final String? id;
  final String? batch;
  final String? code;
  final DateTime? created;
  final String? form;
  final String? manufacturer;
  final List<String?>? photo;
  final List<ResultEntity?>? result;
  final DateTime? sampleDate;
  final StatusEntity? status;
  final List<StatusHistoryEntity?>? statusHistory;
  final String? stepHistory;
  final String? swabType;
  final TypeEntity? type;
  final DateTime? updated;
  final String? user;
  final List<ValidityEntity?>? validity;
  final FormSubmissionStatus? formStatus;

  const TestHistoryState({
    this.id = "",
    this.formStatus = const InitialFormStatus(),
    this.batch = "",
    this.code = "",
    this.created,
    this.form = "",
    this.manufacturer = "",
    this.photo = const [],
    this.result = const [],
    this.sampleDate,
    this.status,
    this.statusHistory = const [],
    this.stepHistory = "",
    this.swabType = "",
    this.type,
    this.updated,
    this.user = "",
    this.validity = const [],
  });

  TestHistoryState copyWith({
    FormSubmissionStatus? formStatus,
    String? id,
    String? batch,
    String? code,
    DateTime? created,
    String? form,
    String? manufacturer,
    List<String?>? photo,
    List<ResultEntity?>? result,
    DateTime? sampleDate,
    StatusEntity? status,
    List<StatusHistoryEntity?>? statusHistory,
    String? stepHistory,
    String? swabType,
    TypeEntity? type,
    DateTime? updated,
    String? user,
    List<ValidityEntity?>? validity,
  }) {
    return TestHistoryState(
      id: id ?? this.id,
      formStatus: formStatus ?? this.formStatus,
      batch: batch ?? this.batch,
      code: code ?? this.code,
      created: created ?? this.created,
      form: form ?? this.form,
      manufacturer: manufacturer ?? this.manufacturer,
      photo: photo ?? this.photo,
      result: result ?? this.result,
      sampleDate: sampleDate ?? this.sampleDate,
      status: status ?? this.status,
      statusHistory: statusHistory ?? this.statusHistory,
      stepHistory: stepHistory ?? this.stepHistory,
      swabType: swabType ?? this.swabType,
      type: type ?? this.type,
      updated: updated ?? this.updated,
      user: user ?? this.user,
      validity: validity ?? this.validity,
    );
  }
}
