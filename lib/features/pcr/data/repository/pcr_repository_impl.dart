import 'package:either_dart/either.dart';
import 'package:Tellme/features/pcr/data/data_source/pcr_data_source.dart';
import 'package:Tellme/features/pcr/domain/repository/pcr_repository.dart';

import '../../../../config/helpers/errors/invalid_data.dart';

class PcrRepositoryImpl implements PcrRepository {
  final PcrDataSource authDataSource;

  PcrRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<Either<InvalidData, bool>> validatePcr(
      String userId, String code) async {
    try {
      final response = await authDataSource.validatePcr(userId, code);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }
}
