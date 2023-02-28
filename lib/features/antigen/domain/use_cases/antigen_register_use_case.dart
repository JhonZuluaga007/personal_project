import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:Tellme/config/helpers/models/server_validate_data.dart';
import 'package:Tellme/features/antigen/domain/entities/antigen_entity.dart';

import '../../../../config/helpers/errors/invalid_data.dart';
import '../repository/antigen_repository.dart';

class AntigenRegisterUseCase {
  AntigenRepository authRepository;
  AntigenRegisterUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, ServerValidate>> call(
      String code,
      QuestionTypeOneEntity question1,
      QuestionTypeTwoEntity question2,
      QuestionTypeOneEntity question3,
      QuestionTypeOneEntity question4,
      QuestionTypeOneEntity question5,
      QuestionTypeOneEntity question6,
      QuestionTypeOneEntity question7,
      QuestionTypeOneEntity question8,
      QuestionTypeOneEntity question9,
      QuestionTypeTwoEntity question10,
      QuestionTypeTwoEntity question11,
      QuestionTypeOneEntity question12,
      QuestionTypeOneEntity question13,
      QuestionTypeOneEntity question14,
      QuestionTypeOneEntity question15,
      String? stepHistory,
      File files) async {
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
        files);
  }
}
