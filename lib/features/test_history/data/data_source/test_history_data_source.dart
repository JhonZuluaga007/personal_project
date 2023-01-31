import 'package:flutter/material.dart';
import 'package:personal_project/config/helpers/api.dart';
import 'package:personal_project/config/helpers/endpoints.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';
import 'package:personal_project/features/test_history/data/models/test_history_models.dart';

class TestHistoryDataSource {
  Future<List<Data>> getHistoryTest(String userId) async {
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
