import 'dart:convert';

import 'package:personal_project/config/helpers/api.dart';
import 'package:personal_project/config/helpers/endpoints.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';
import 'package:personal_project/config/helpers/models/server_error.dart';
import 'package:http/http.dart' as http;

import 'package:personal_project/features/antigen/data/models/antigen_model.dart';

class AntigenDataSource {
  Future<AntigenModel> validateAntigen(String userId, String code) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(Endpoints.validateAntigen));
    request.fields.addAll({'code': code, 'userId': userId});

    http.StreamedResponse response = await request.send();
    final responseString = await response.stream.bytesToString();
    final decodedMap = json.decode(responseString);

    if (decodedMap["statusCode"] == 200) {
      AntigenModel antigenModel = AntigenModel.fromMap(decodedMap);
      return antigenModel;
    } else {
      throw InvalidData(ServerError.fromMap(decodedMap).errorMessage);
    }
  }

  Future<AntigenModel> registerAntigen(String code) async {
    final response = await Api.get(Endpoints.registerTest);

    try {
      AntigenModel medicalHistoryModel =
          AntigenModel.fromJson(response);
      return medicalHistoryModel;
    } on InvalidData catch (invalidData) {
      throw InvalidData(invalidData.toString());
    }
  }
}
