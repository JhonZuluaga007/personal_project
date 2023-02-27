import 'package:either_dart/either.dart';
import 'package:Tellme/config/helpers/errors/invalid_data.dart';

abstract class PcrRepository {
  Future<Either<InvalidData, bool>> validatePcr(String userId, String code);
}
