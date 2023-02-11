import 'package:flutter/material.dart';

import '../models/test_history_models.dart';
import '../../../../config/helpers/api.dart';
import '../../../../config/helpers/endpoints.dart';
import '../../domain/entities/test_history_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class TestHistoryDataSource {
  Future<List<TestHistoryEntity>> getHistoryTest(String userId) async {
    try {
      final response = await Api.get('${Endpoints.testHistory}$userId');
      if (response["statusCode"] == 200) {
        HistoryTestModel historyTest = HistoryTestModel.fromJson(response);
        debugPrint(
            "result data response historyTest.data.length: ${historyTest.data.length}");
        return historyTest.data;
      } else {
        throw InvalidData("No se encontro datos");
      }
    } on InvalidData catch (invalidData) {
      throw InvalidData("Data no encontrada");
    }
  }
}
