import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:personal_project/config/helpers/models/server_validate_data.dart';

import '../../data/models/antigen_model.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../entities/antigen_entity.dart';

abstract class AntigenRepository {
  Future<Either<InvalidData, AntigenModel>> validateAntigen(
      String userId, String code);

  Future<Either<InvalidData, ServerValidate>> registerTest(
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
    QuestionTypeTwoEntity question12,
    QuestionTypeOneEntity question13,
    QuestionTypeOneEntity question14,
    QuestionTypeOneEntity question15,
    String? stepHistory,
    File files
  );
}
