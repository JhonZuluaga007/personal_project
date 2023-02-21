import 'package:either_dart/either.dart';

import '../../data/models/antigen_model.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

abstract class AntigenRepository {
  Future<Either<InvalidData, AntigenModel>> validateAntigen(
      String userId, String code);
}
