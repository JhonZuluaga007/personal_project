import 'package:either_dart/either.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';
import 'package:personal_project/features/medical_history/data/data_source/medical_data_source.dart';
import 'package:personal_project/features/medical_history/domain/entities/medical_history_entity.dart';
import 'package:personal_project/features/medical_history/domain/repository/medical_history_repository.dart';

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
}
