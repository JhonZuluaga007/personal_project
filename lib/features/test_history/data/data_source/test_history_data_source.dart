import 'package:flutter/material.dart';

import '../models/test_history_models.dart';
import '../../../../config/helpers/api.dart';
import '../../../../config/helpers/endpoints.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class TestHistoryDataSource {
  Future<TestHistoryModel> getHistoryTest() async {
    try {
      final response = await Api.get(Endpoints.testHistory);
      if (response["statusCode"] == 200) {
        TestHistoryModel historyTest = TestHistoryModel.fromMap(response);
        debugPrint(
            "result data response historyTest.data.length: ${historyTest.data.tests.length}");
        return historyTest;
      } else {
        throw InvalidData("No se encontro datos");
      }
    } on InvalidData {
      throw InvalidData("Data no encontrada");
    }
  }
}
