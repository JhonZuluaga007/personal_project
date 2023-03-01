import 'package:Tellme/config/helpers/endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:Tellme/config/helpers/errors/invalid_data.dart';
import 'package:Tellme/config/helpers/models/server_error.dart';

class PcrDataSource {
  Future<bool> validatePcr(String userId, String code) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(Endpoints.validatePcr));
    request.fields.addAll({'code': code, 'userId': userId});
    http.StreamedResponse response = await request.send();

    final responseString = await response.stream.bytesToString();
    final decodedMap = json.decode(responseString);
    bool success = false;

    if (decodedMap["statusCode"] == 200) {
      success = true;
      return success;
    } else {
      success = false;
      throw InvalidData(ServerError.fromMap(decodedMap).errorMessage);
    }
  }
}
