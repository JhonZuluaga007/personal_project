import 'package:either_dart/either.dart';

import '../data_source/medical_data_source.dart';
import '../../domain/entities/medical_history_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../domain/repository/medical_history_repository.dart';
import '../../../../config/helpers/models/server_validate_data.dart';

class MedicalHistoryRepositoryImpl implements MedicalHistoryRepository {
  final MedicalHistoryDataSource medicalHistoryDataSource;
  MedicalHistoryRepositoryImpl({required this.medicalHistoryDataSource});

  @override
  Future<Either<InvalidData, MedicalHistoryEntity>> getMedicalHistory(
      String userId) async {
    try {
      final MedicalHistoryEntity response =
          await medicalHistoryDataSource.getMedicalHistory(userId);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }

  @override
  Future<Either<InvalidData, ServerValidate>> editMedicalHistory(
      String userId, String responseOne, List<String> responseTwo) async {
    try {
      final ServerValidate response = await medicalHistoryDataSource
          .editMedicalHistory(userId, responseOne, responseTwo);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }
}
