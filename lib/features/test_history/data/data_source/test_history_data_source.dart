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




// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// import '../models/test_history_models.dart';
// import '../../../../config/helpers/api.dart';
// import '../../../../config/helpers/endpoints.dart';
// import '../../../../config/helpers/errors/invalid_data.dart';

// class TestHistoryDataSource {
//   Future<TestHistoryModel> getHistoryTest() async {
//     try {
//         final prefs = await SharedPreferences.getInstance();
//     String bearerToken = prefs.getString('Basic')!;
//     var headers = {'Authorization': 'Bearer $bearerToken', 'content-type': 'application/json'};
//       var request = http.Request('GET', Uri.parse(Endpoints.testHistory));
//       request.headers.addAll(headers);
// http.StreamedResponse response = await request.send();

//       if (response.statusCode== 200) {
//           final responseString = await response.stream.bytesToString();
//       final decodedMap = json.decode(responseString);
//         TestHistoryModel historyTest = TestHistoryModel.fromMap(decodedMap);
//         debugPrint(
//             "result data response historyTest.data.length: ${historyTest.data.tests.length}");
//         return historyTest;
//       } else {
//         throw InvalidData("No se encontro datos");
//       }
//     } on InvalidData {
//       throw InvalidData("Data no encontrada");
//     }
//   }
// }


