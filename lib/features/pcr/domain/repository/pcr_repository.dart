import 'package:either_dart/either.dart';
import 'package:Tellme/config/helpers/errors/invalid_data.dart';

import '../../data/models/pcr_test_model.dart';

abstract class PcrRepository {
  Future<Either<InvalidData, PcrTestModel>> validatePcr(String userId, String code);
}
