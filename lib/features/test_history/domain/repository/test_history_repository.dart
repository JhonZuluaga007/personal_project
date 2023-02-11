import 'package:either_dart/either.dart';

import '../entities/test_view_entity.dart';
import '../entities/test_history_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

abstract class TestHistoryRepository {
  Future<Either<InvalidData, List<TestHistoryEntity>>> getHistoryTest(
      String userId);
  Future<Either<InvalidData, List<TestViewEntity>>> getViewTest(String testId);
}
