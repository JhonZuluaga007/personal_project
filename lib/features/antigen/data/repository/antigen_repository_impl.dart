import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:personal_project/config/helpers/models/server_validate_data.dart';

import '../../domain/entities/antigen_entity.dart';
import '../models/antigen_model.dart';
import '../data_source/antigen_data_source.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../domain/repository/antigen_repository.dart';

class AntigenRepositoryImpl implements AntigenRepository {
  final AntigenDataSource authDataSource;

  AntigenRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<Either<InvalidData, AntigenModel>> validateAntigen(
      String userId, String code) async {
    try {
      final AntigenModel response =
          await authDataSource.validateAntigen(userId, code);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }

  @override
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
      QuestionTypeOneEntity question12,
      QuestionTypeOneEntity question13,
      QuestionTypeOneEntity question14,
      QuestionTypeOneEntity question15,
      String? stepHistory,
      File files) async {
    try {
      final ServerValidate response = await authDataSource.registerTest(
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
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }
}
