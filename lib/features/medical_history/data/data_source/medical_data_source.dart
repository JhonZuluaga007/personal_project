import '../../../../config/helpers/api.dart';
import '../models/medical_history_model.dart';
import '../../../../config/helpers/endpoints.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class MedicalHistoryDataSource {
  Future<MedicalHistoryModel> getMedicalHistory() async {
    final response = await Api.get(Endpoints.viewMedicalHistory);
    try {
      MedicalHistoryModel medicalHistoryModel =
          MedicalHistoryModel.fromJson(response);
      return medicalHistoryModel;
    } on InvalidData catch (invalidData) {
      throw InvalidData(invalidData.toString());
    }
  }

  Future<MedicalHistoryModel> editMedicalHistory(
      bool valueQuestion1, List<String> valueIdquestion2) async {
    var response = await Api.put(Endpoints.editMedicalHistory, {
      "project": "ChelseaProject",
      "answers": [
        {
          "name": "additional_information",
          "value": valueQuestion1,
          "type": "bool"
        },
        {
          "name": "risk_factors",
          "value": valueIdquestion2,
          "type": "array-objects"
        }
      ]
    });

    if (response['statusCode'] == 200) {
      return MedicalHistoryModel.fromJson(response);
    } else {
      throw InvalidData('error of save the data');
    }
  }
}
