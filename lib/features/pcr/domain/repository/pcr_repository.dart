import 'package:either_dart/either.dart';

import '../../data/models/pcr_test_model.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

abstract class PcrRepository {
  Future<Either<InvalidData, PcrTestModel>> validatePcr(
      String userId, String code);
}
