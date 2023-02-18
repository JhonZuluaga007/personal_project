import 'package:either_dart/either.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';

abstract class PcrRepository {
  Future<Either<InvalidData, bool>> validatePcr(
      String userId, String code);
}
