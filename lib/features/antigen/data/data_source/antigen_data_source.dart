import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:Tellme/config/helpers/models/server_validate_data.dart';

import '../../domain/entities/antigen_entity.dart';
import '../../../../config/helpers/endpoints.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../../config/helpers/models/server_error.dart';
import '../models/antigen_model.dart';

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
      throw InvalidData(ServerError.fromMap(decodedMap).errorMessage.text);
    }
  }

  Future<ServerValidate> registerTest(
      String code,
      QuestionTypeOneEntity question1,
      QuestionTypeTwoEntity question2,
      QuestionTypeOneEntity question3,
      QuestionTypeOneEntity question4,
      QuestionTypeOneEntity question5,
      QuestionTypeOneEntity question6,
      QuestionTypeOneEntity question7,
      QuestionTypeOneEntity question8,
      QuestionTypeOneEntity question9,
      QuestionTypeTwoEntity question10,
      QuestionTypeTwoEntity question11,
      QuestionTypeTwoEntity question12,
      QuestionTypeOneEntity question13,
      QuestionTypeOneEntity question14,
      QuestionTypeOneEntity question15,
      String? stepHistory,
      File files) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(Endpoints.registerTest));
    request.fields.addAll({
      "code": code,
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
      "step_history": "",
    });

    var file = files.path;
    request.files.add(await http.MultipartFile.fromPath("file", file));

    http.StreamedResponse response = await request.send();
    final responseString = await response.stream.bytesToString();
    final decodedMap = json.decode(responseString);

    if (response.statusCode == 200) {
      ServerValidate success = ServerValidate.fromMap(decodedMap);
      return success;
    } else {
      throw InvalidData(ServerError.fromMap(decodedMap).errorMessage.text);
    }
  }
}
