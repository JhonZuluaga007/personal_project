import 'package:either_dart/either.dart';

import '../../domain/entities/test_view_entity.dart';
import '../data_source/test_history_data_source.dart';
import '../../domain/entities/test_history_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../domain/repository/test_history_repository.dart';

class TestHistoryRepositoryImpl extends TestHistoryRepository {
  final TestHistoryDataSource testHistoryDataSource;

  TestHistoryRepositoryImpl({
    required this.testHistoryDataSource,
  });
  @override
  Future<Either<InvalidData, List<TestHistoryEntity>>> getHistoryTest(
      String userId) async {
    try {
      final List<TestHistoryEntity> response =
          await testHistoryDataSource.getHistoryTest(userId);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }

  @override
  Future<Either<InvalidData, List<TestViewEntity>>> getViewTest(
      String testId) async {
    try {
      final List<TestViewEntity> response =
          await testHistoryDataSource.getViewTest(testId);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }
}
