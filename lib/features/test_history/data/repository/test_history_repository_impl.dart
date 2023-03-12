import 'package:either_dart/either.dart';

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
  Future<Either<InvalidData, TestHistoryResponseEntity>> getHistoryTest() async {
    try {
      final TestHistoryResponseEntity response =
          await testHistoryDataSource.getHistoryTest();
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }
}
