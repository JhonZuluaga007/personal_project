import '../models/antigen_model.dart';
import '../../../../config/helpers/api.dart';
import '../models/antigen_register_model.dart';
import '../../../../config/helpers/endpoints.dart';
import '../../../../config/helpers/models/server_error.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../antigen/domain/entities/antigen_entity.dart';
import '../../../auth/domain/entities/options_tools_entity.dart';

class AntigenDataSource {
  Future<AntigenModel> validateAntigen(String code) async {
    var response = await Api.post(
        Endpoints.validateAntigen, {"project": "ChelseaProject", "code": code});

    if (response["statusCode"] == 200) {
      AntigenModel antigenModel = AntigenModel.fromMap(response);
      return antigenModel;
    } else {
      throw InvalidData(ServerError.fromMap(response).errorMessage.text);
    }
  }

  Future<AntigenRegisterModel> registerTest(
      String code,
      List<OpSymptomEntity> symptoms,
      List<OpVaccineEntity> vaccines,
      QuestionType1StringEntity question1,
      QuestionType10ListEntity question2,
      QuestionType1StringEntity question3,
      QuestionType1StringEntity question4,
      QuestionType1StringEntity question5,
      QuestionType1StringEntity question6,
      QuestionType1StringEntity question7,
      QuestionType1StringEntity question8,
      QuestionType1StringEntity question9,
      QuestionType10ListEntity question10,
      QuestionType10ListEntity question11,
      QuestionType1StringEntity question12,
      QuestionType1StringEntity question13,
      QuestionType1StringEntity question14,
      QuestionType1StringEntity question15,
      List<String>? stepHistory,
      String? testImage) async {
    var response = await Api.post(Endpoints.registerTest, {
      "project": "ChelseaProject",
      "code": code,
      "symptoms": symptoms.map((symptom) => symptom.id).toList(),
      "vaccines": vaccines.map((vaccine) => vaccine.id).toList(),
      "question1": question1.toJson(),
      "question2": question2.toJson(),
      "question3": question3.toJson(),
      "question4": question4.toJson(),
      "question5": question5.toJson(),
      "question6": question6.toJson(),
      "question7": question7.toJson(),
      "question8": question8.toJson(),
      "question9": question9.toJson(),
      "question10": question10.toJson(),
      "question11": question11.toJson(),
      "question12": question12.toJson(),
      "question13": question13.toJson(),
      "question14": question14.toJson(),
      "question15": question15.toJson(),
      "step_history": stepHistory,
      "testImage": testImage
    });

    if (response["statusCode"] == 200) {
      AntigenRegisterModel antigenModel =
          AntigenRegisterModel.fromMap(response);
      return antigenModel;
    } else {
      throw InvalidData(ServerError.fromMap(response).errorMessage.text);
    }
  }
}
