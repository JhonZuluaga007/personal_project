import 'package:personal_project/config/helpers/endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AntigenDataSource {
  Future<bool> validateAntigen(String userId, String code) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(Endpoints.validateAntigen));
    request.fields.addAll({'code': code, 'userId': userId});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final decodedMap = json.decode(responseString);
      bool success = false;
      if (decodedMap['statusCode'] == 200) {
        success = true;
      }
      return success;
    } else {
      return false;
    }
  }
}
