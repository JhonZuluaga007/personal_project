import 'package:either_dart/either.dart';

import '../entities/test_history_entity.dart';
import '../repository/test_history_repository.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class TestHistoryUseCases {
  final TestHistoryRepository testHistoryRepository;

  TestHistoryUseCases({
    required this.testHistoryRepository,
  });

  Future<Either<InvalidData, List<TestHistoryEntity>>> call(
      String userId) async {
    return await testHistoryRepository.getHistoryTest(userId);
  }
}
