import 'package:either_dart/either.dart';

import '../data_source/antigen_data_source.dart';
import '../../domain/entities/antigen_entity.dart';
import '../../domain/repository/antigen_repository.dart';
import '../../domain/entities/antigen_register_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../auth/domain/entities/options_tools_entity.dart';

class AntigenRepositoryImpl implements AntigenRepository {
  final AntigenDataSource authDataSource;

  AntigenRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<Either<InvalidData, AntigenResponseEntity>> validateAntigen(
      String code) async {
    try {
      final AntigenResponseEntity response =
          await authDataSource.validateAntigen(code);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }

  // @override
  Future<Either<InvalidData, AntigenRegisterResponseEntity>> registerTest(
      String code,
      List<OpSymptomEntity> symptoms,
      List<OpVaccineEntity> vaccines,
      QuestionType1StringEntity question1,
      QuestionType10ListEntity question2,
      QuestionType1StringEntity question3,
      QuestionType1StringEntity question4,
      QuestionType1StringEntity question5,
      QuestionType1StringEntity question6,
      QuestionType1StringEntity question7,
      QuestionType1StringEntity question8,
      QuestionType1StringEntity question9,
      QuestionType10ListEntity question10,
      QuestionType10ListEntity question11,
      QuestionType10ListEntity question12,
      QuestionType1StringEntity question13,
      QuestionType1StringEntity question14,
      QuestionType1StringEntity question15,
      List<String>? stepHistory,
      String? testImage) async {
    try {
      final AntigenRegisterResponseEntity response =
          await authDataSource.registerTest(
              code,
              symptoms,
              vaccines,
              question1,
              question2,
              question3,
              question4,
              question5,
              question6,
              question7,
              question8,
              question9,
              question10,
              question11,
              question12,
              question13,
              question14,
              question15,
              stepHistory!,
              testImage);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }
}
