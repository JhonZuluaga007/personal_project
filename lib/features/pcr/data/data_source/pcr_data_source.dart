import 'package:Tellme/config/helpers/endpoints.dart';

import 'package:Tellme/config/helpers/errors/invalid_data.dart';
import 'package:Tellme/config/helpers/models/server_error.dart';

import '../../../../config/helpers/api.dart';

class PcrDataSource {
  Future<bool> validatePcr(String project, String code) async {
    bool success = false;

    final response = await Api.post(Endpoints.validatePcr,{});
    if (response["statusCode"] == 200) {
      success = true;
      return success;
    } else {
      success = false;
      throw InvalidData(
        ServerError.fromMap(response).errorMessage.text,
      );
    }
  }
}
