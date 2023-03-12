import 'package:either_dart/either.dart';

import '../entities/test_history_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

abstract class TestHistoryRepository {
  Future<Either<InvalidData, TestHistoryResponseEntity>> getHistoryTest();
}
