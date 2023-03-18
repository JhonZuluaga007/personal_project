import '../../domain/entities/antigen_entity.dart';
import '../../../test_history/domain/entities/test_history_entity.dart';

class AntigenRegisterResponseEntity {
  AntigenRegisterResponseEntity({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final DataRegisterAntigenEntity data;
  final MessageTestEntity message;
  final int statusCode;
}

class DataRegisterAntigenEntity {
  DataRegisterAntigenEntity({
    required this.test,
  });
  final TestRegisterAntigenEntity test;
}

class TestRegisterAntigenEntity {
  TestRegisterAntigenEntity({
    required this.id,
    required this.associatedTests,
    required this.batch,
    required this.code,
    required this.created,
    required this.form,
    required this.laboratory,
    required this.manufacturer,
    required this.photo,
    required this.preparedBy,
    required this.project,
    required this.result,
    required this.sampleDate,
    required this.status,
    required this.statusHistory,
    required this.stepHistory,
    required this.swabType,
    required this.symptoms,
    required this.type,
    required this.updated,
    required this.vaccines,
    required this.validity,
  });

  final IdTestEntity id;
  final List<dynamic> associatedTests;
  final IdTestEntity batch;
  final String code;
  final CreatedTestEntity created;
  final IdTestEntity form;
  final List<dynamic> laboratory;
  final List<ManufacturerAntigenEntity> manufacturer;
  final String photo;
  final IdTestEntity preparedBy;
  final IdTestEntity project;
  final List<ResultTestEntity> result;
  final CreatedTestEntity sampleDate;
  final List<StatusTestEntity> status;
  final List<StatusHistoryEntity> statusHistory;
  final List<dynamic> stepHistory;
  final List<dynamic> swabType;
  final List<dynamic> symptoms;
  final List<TypeTestEntity> type;
  final CreatedTestEntity updated;
  final List<dynamic> vaccines;
  final List<dynamic> validity;
}
