import 'package:either_dart/either.dart';

import '../repository/antigen_repository.dart';
import '../entities/antigen_register_entity.dart';
import '../../domain/entities/antigen_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class AntigenRegisterUseCase {
  AntigenRepository authRepository;
  AntigenRegisterUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, AntigenRegisterResponseEntity>> call(
      String code,
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
    return await authRepository.registerTest(
        code,
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
  }
}
