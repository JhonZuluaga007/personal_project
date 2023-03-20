import 'package:either_dart/either.dart';

import '../entities/antigen_entity.dart';
import '../entities/antigen_register_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../auth/domain/entities/options_tools_entity.dart';

abstract class AntigenRepository {
  Future<Either<InvalidData, AntigenResponseEntity>> validateAntigen(
      String code);

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
    String? testImage,
  );
}
