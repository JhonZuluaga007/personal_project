import 'package:either_dart/either.dart';
import 'package:personal_project/features/antigen/data/data_source/antigen_data_source.dart';
import 'package:personal_project/features/antigen/data/models/antigen_model.dart';

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

}