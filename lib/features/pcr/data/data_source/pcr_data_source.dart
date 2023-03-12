import 'package:Tellme/features/pcr/data/models/pcr_test_model.dart';

import '../../../../config/helpers/api.dart';
import 'package:Tellme/config/helpers/endpoints.dart';
import 'package:Tellme/config/helpers/errors/invalid_data.dart';
import 'package:Tellme/config/helpers/models/server_error.dart';

class PcrDataSource {
  Future<PcrTestModel> validatePcr(String project, String code) async {
    final response = await Api.post(Endpoints.validatePcr,
      {
        "project": project,
        "code": code
      });
    if (response["statusCode"] == 200) {
      PcrTestModel pcrModel = PcrTestModel.fromMap(response);
      return pcrModel;
    } else {
      throw InvalidData(
        ServerError.fromMap(response).errorMessage.text,
      );
    }
  }
}
