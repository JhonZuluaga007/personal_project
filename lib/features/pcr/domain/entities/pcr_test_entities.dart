import '../../../test_history/data/models/test_history_models.dart';
import '../../../test_history/domain/entities/test_history_entity.dart';

class PCRTestModel {
  PCRTestModel({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final DataPcrEntity data;
  final MessageTestEntity message;
  final int statusCode;
}

class DataPcrEntity {
  DataPcrEntity({
    required this.test,
  });

  final TestPcrEntity test;
}

class TestPcrEntity {
  TestPcrEntity({
    required this.ic,
    required this.n,
    required this.orf1Ab,
    required this.id,
    required this.associatedTests,
    required this.batch,
    required this.code,
    required this.created,
    required this.laboratory,
    required this.manufacturer,
    required this.preparedBy,
    required this.project,
    required this.result,
    required this.sampleDate,
    required this.status,
    required this.statusHistory,
    required this.swabType,
    required this.symptoms,
    required this.type,
    required this.updated,
    required this.vaccines,
    required this.validity,
    required this.vialName,
  });

  final int ic;
  final int n;
  final int orf1Ab;
  final IdTestEntity id;
  final List<AssociatedPcrEntity> associatedTests;
  final IdTestEntity batch;
  final String code;
  final CreatedHistory created;
  final List<dynamic> laboratory;
  final List<dynamic> manufacturer;
  final IdTestEntity preparedBy;
  final IdTestEntity project;
  final List<dynamic> result;
  final CreatedHistory sampleDate;
  final List<StatusTestEntity> status;
  final List<StatusHistoryEntity> statusHistory;
  final List<dynamic> swabType;
  final List<dynamic> symptoms;
  final List<TypeHistory> type;
  final CreatedHistory updated;
  final List<dynamic> vaccines;
  final List<dynamic> validity;
  final String vialName;
}

class AssociatedPcrEntity {
  AssociatedPcrEntity({
    required this.id,
    required this.associatedTests,
    required this.batch,
    required this.code,
    required this.created,
    required this.form,
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
  final String manufacturer;
  final List<String> photo;
  final IdTestEntity preparedBy;
  final IdTestEntity project;
  final IdTestEntity result;
  final CreatedTestEntity sampleDate;
  final IdTestEntity status;
  final List<StatusHistoryEntity> statusHistory;
  final List<dynamic> stepHistory;
  final String swabType;
  final List<IdTestEntity> symptoms;
  final IdTestEntity type;
  final CreatedTestEntity updated;
  final List<IdHistory> vaccines;
  final IdTestEntity validity;
}
