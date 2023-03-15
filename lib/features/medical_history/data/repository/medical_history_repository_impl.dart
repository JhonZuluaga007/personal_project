import 'package:either_dart/either.dart';

import '../data_source/medical_data_source.dart';
import '../../domain/entities/medical_history_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../domain/repository/medical_history_repository.dart';

class MedicalHistoryRepositoryImpl implements MedicalHistoryRepository {
  final MedicalHistoryDataSource medicalHistoryDataSource;
  MedicalHistoryRepositoryImpl({required this.medicalHistoryDataSource});

  @override
  Future<Either<InvalidData, MedicalHistoryResponseEntity>>
      getMedicalHistory() async {
    try {
      final MedicalHistoryResponseEntity response =
          await medicalHistoryDataSource.getMedicalHistory();
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }

  @override
  Future<Either<InvalidData, MedicalHistoryResponseEntity>> editMedicalHistory(
      bool responseOne, List<String> responseTwo) async {
    try {
      final MedicalHistoryResponseEntity response =
          await medicalHistoryDataSource.editMedicalHistory(
              responseOne, responseTwo);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }
}
