import 'package:flutter/foundation.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';
import 'package:personal_project/features/medical_history/data/models/medical_history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/helpers/api.dart';
import '../../../../config/helpers/endpoints.dart';

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
}
