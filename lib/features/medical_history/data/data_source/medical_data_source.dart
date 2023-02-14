import 'dart:convert';

import '../../../../config/helpers/api.dart';
import '../models/medical_history_model.dart';
import '../../../../config/helpers/endpoints.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../../config/helpers/models/server_validate_data.dart';
import 'package:http/http.dart' as http;

class MedicalHistoryDataSource {
  Future<MedicalHistoryModel> getMedicalHistory(String userId) async {
    final response = await Api.get('${Endpoints.viewMedicalHistory}$userId');
    try {
      MedicalHistoryModel medicalHistoryModel =
          MedicalHistoryModel.fromJson(response[0]);
      return medicalHistoryModel;
    } on InvalidData catch (invalidData) {
      throw InvalidData(invalidData.toString());
    }
  }

  Future<ServerValidate> editMedicalHistory(
      String userId, String responseOne, List<String> responseTwo) async {
    final questionOne = {
      "name":
          "Would you like to provide additional information about your Medical History?",
      "value": responseOne
    };
    final questionTwo = {
      "name":
          "Do you have any of the following conditions that the CDC classifies as risk factors for severe COVID-19?",
      "value": responseTwo
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Endpoints.editMedicalHistory}$userId'));
    request.fields.addAll({
      'question1': jsonEncode(questionOne),
      'question2': jsonEncode(questionTwo)
    });

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final decodedMap = json.decode(responseString);
      bool success = false;
      if (decodedMap['statusCode'] == 200) {
        success = true;
      }
      return ServerValidate.fromJson(decodedMap);
    } else {
      throw InvalidData('error');
    }

    // final response = await Api.post(
    //   '${Endpoints.editMedicalHistory}$userId',
    //   {
    //     "question1": questionOne,
    //     "question2": questionTwo,
    //   },
    // );
    // try {
    //   ServerValidate serverValidate = ServerValidate.fromJson(response);
    //   return serverValidate;
    // } on InvalidData catch (invalidData) {
    //   throw InvalidData(invalidData.toString());
    // }
  }
}
