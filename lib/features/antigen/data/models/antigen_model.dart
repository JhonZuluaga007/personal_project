import 'dart:convert';

import '../../domain/entities/antigen_entity.dart';
import '../../../auth/data/models/options_tools_model.dart';
import '../../../test_history/data/models/test_history_models.dart';

class AntigenModel extends AntigenResponseEntity {
  AntigenModel({
    required DataAntigen data,
    required MessageHistory message,
    required int statusCode,
  }) : super(data: data, message: message, statusCode: statusCode);

  factory AntigenModel.fromMap(Map<String, dynamic> json) => AntigenModel(
        data: DataAntigen.fromMap(json["data"]),
        message: MessageHistory.fromMap(json["message"]),
        statusCode: json["statusCode"],
      );
}

class DataAntigen extends DataAntigenEntity {
  DataAntigen({
    LastTestAntigen? lastTest,
    required TestAntigen test,
  }) : super(lastTest: lastTest, test: test);

  factory DataAntigen.fromMap(Map<String, dynamic> json) => DataAntigen(
        lastTest: json["last_test"] != null
            ? LastTestAntigen.fromMap(json["last_test"])
            : LastTestAntigen(
                id: IdHistory(oid: ""),
                associatedTests: [],
                batch: IdHistory(oid: ""),
                code: "",
                created: CreatedHistory(date: DateTime.now()),
                form: [
                  FormAntigen(
                    id: IdHistory(oid: ''),
                    ip: '',
                    question1: QuestionType1String(
                        name:
                            'Are you currently experiencing any symptoms related to Covid-19?',
                        value: ''),
                    question2: QuestionType10List(
                        name:
                            'Please check all symptoms associated with Covid-19 you’re currently experiencing.',
                        value: []),
                    question3: QuestionType1String(
                        name: 'When did you start experiencing these symptoms?',
                        value: ''),
                    question4: QuestionType1String(
                        name:
                            'In the last 14 days, have you tested positive for COVID-19?',
                        value: ''),
                    question5: QuestionType1String(
                        name: 'When did you test positive for COVID-19?',
                        value: ''),
                    question6: QuestionType1String(
                        name:
                            'In the last 14 days, have you been in contact with anyone who has tested positive for COVID-19?',
                        value: ''),
                    question7: QuestionType1String(
                        name: 'Have you received a COVID-19 vaccine?',
                        value: ''),
                    question8: QuestionType1String(
                        name: 'How many Boosters have you had so far?',
                        value: 'Select option'),
                    question9: QuestionType1String(
                        name:
                            'When did you receive your most recent COVID-19 vaccine?',
                        value: ''),
                    question10: QuestionType10List(
                        name:
                            'Which vaccine(s) did you receive? (Please select all that apply)',
                        value: []),
                    question11: QuestionType10List(
                        name:
                            'Did you have Covid before? (Please select all that apply)',
                        value: []),
                    question12: QuestionType10List(
                        name: 'Are you currently pregnant', value: []),
                    question13: QuestionType1String(
                        name:
                            'Do you see a line next to the control band, indicated as C on your test?',
                        value: ''),
                    question14: QuestionType1String(
                        name:
                            'Do you to see a line next to the test band, indicated as T on your test?',
                        value: ''),
                    question15: QuestionType1String(
                        name: 'Do you have a PCR test?', value: ''),
                    test: IdHistory(oid: ''),
                  )
                ],
                laboratory: [],
                manufacturer: [],
                photo: '',
                preparedBy: IdHistory(oid: ""),
                project: IdHistory(oid: ""),
                result: [],
                sampleDate: CreatedHistory(date: DateTime.now()),
                status: [],
                statusHistory: [],
                stepHistory: [],
                swabType: [],
                symptoms: [],
                type: [],
                updated: CreatedHistory(date: DateTime.now()),
                vaccines: [],
                validity: []),
        test: TestAntigen.fromMap(json["test"]),
      );
}

class LastTestAntigen extends LastTestAntigenEntity {
  LastTestAntigen({
    required IdHistory id,
    required List<dynamic> associatedTests,
    required IdHistory batch,
    required String code,
    required CreatedHistory created,
    required List<FormAntigen> form,
    required List<dynamic> laboratory,
    required List<dynamic> manufacturer,
    required String photo,
    required IdHistory preparedBy,
    required IdHistory project,
    required List<ResultHistory> result,
    required CreatedHistory sampleDate,
    required List<StatusHistory> status,
    required List<StatusTestHistory> statusHistory,
    required List<dynamic> stepHistory,
    required List<dynamic> swabType,
    required List<Symptom> symptoms,
    required List<TypeHistory> type,
    required CreatedHistory updated,
    required List<Vaccine> vaccines,
    required List<ValidityHistory> validity,
  }) : super(
            id: id,
            associatedTests: associatedTests,
            batch: batch,
            code: code,
            created: created,
            form: form,
            laboratory: laboratory,
            manufacturer: manufacturer,
            photo: photo,
            preparedBy: preparedBy,
            project: project,
            result: result,
            sampleDate: sampleDate,
            status: status,
            statusHistory: statusHistory,
            stepHistory: stepHistory,
            swabType: swabType,
            symptoms: symptoms,
            type: type,
            updated: updated,
            vaccines: vaccines,
            validity: validity);

  factory LastTestAntigen.fromMap(Map<String, dynamic> json) => LastTestAntigen(
        id: IdHistory.fromMap(json["_id"]),
        associatedTests:
            List<dynamic>.from(json["associated_tests"].map((x) => x)),
        batch: IdHistory.fromMap(json["batch"]),
        code: json["code"],
        created: CreatedHistory.fromMap(json["created"]),
        form: List<FormAntigen>.from(
            json["form"].map((x) => FormAntigen.fromMap(x))),
        laboratory: List<dynamic>.from(json["laboratory"].map((x) => x)),
        manufacturer: List<dynamic>.from(json["manufacturer"].map((x) => x)),
        photo: json["photo"],
        /*List<String>.from(json["photo"].map((x) => x)),*/
        preparedBy: IdHistory.fromMap(json["prepared_by"]),
        project: IdHistory.fromMap(json["project"]),
        result: List<ResultHistory>.from(
            json["result"].map((x) => ResultHistory.fromMap(x))),
        sampleDate: CreatedHistory.fromMap(json["sample_date"]),
        status: List<StatusHistory>.from(
            json["status"].map((x) => StatusHistory.fromMap(x))),
        statusHistory: List<StatusTestHistory>.from(
            json["status_history"].map((x) => StatusTestHistory.fromMap(x))),
        stepHistory: List<dynamic>.from(json["step_history"].map((x) => x)),
        swabType: List<dynamic>.from(json["swab_type"].map((x) => x)),
        symptoms:
            List<Symptom>.from(json["symptoms"].map((x) => Symptom.fromMap(x))),
        type: List<TypeHistory>.from(
            json["type"].map((x) => TypeHistory.fromMap(x))),
        updated: CreatedHistory.fromMap(json["updated"]),
        vaccines:
            List<Vaccine>.from(json["vaccines"].map((x) => Vaccine.fromMap(x))),
        validity: List<ValidityHistory>.from(
            json["validity"].map((x) => ValidityHistory.fromMap(x))),
      );
}

class FormAntigen extends FormAntigenEntity {
  FormAntigen({
    required IdHistory id,
    required String ip,
    required QuestionType1String question1,
    required QuestionType10List question2,
    required QuestionType1String question3,
    required QuestionType1String question4,
    required QuestionType1String question5,
    required QuestionType1String question6,
    required QuestionType1String question7,
    required QuestionType1String question8,
    required QuestionType1String question9,
    required QuestionType10List question10,
    required QuestionType10List question11,
    required QuestionType10List question12,
    required QuestionType1String question13,
    required QuestionType1String question14,
    required QuestionType1String question15,
    required IdHistory test,
  }) : super(
            id: id,
            ip: ip,
            question1: question1,
            question10: question10,
            question11: question11,
            question12: question12,
            question13: question13,
            question14: question14,
            question15: question15,
            question2: question2,
            question3: question3,
            question4: question4,
            question5: question5,
            question6: question6,
            question7: question7,
            question8: question8,
            question9: question9,
            test: test);

  factory FormAntigen.fromMap(Map<String, dynamic> json) => FormAntigen(
        id: IdHistory.fromMap(json["_id"]),
        ip: json["ip"],
        question1: QuestionType1String.fromMap(json["question1"]),
        question10: QuestionType10List.fromMap(json["question10"]),
        question11: QuestionType10List.fromMap(json["question11"]),
        question12: QuestionType10List.fromMap(json["question12"]),
        question13: QuestionType1String.fromMap(json["question13"]),
        question14: QuestionType1String.fromMap(json["question14"]),
        question15: QuestionType1String.fromMap(json["question15"]),
        question2: QuestionType10List.fromMap(json["question2"]),
        question3: QuestionType1String.fromMap(json["question3"]),
        question4: QuestionType1String.fromMap(json["question4"]),
        question5: QuestionType1String.fromMap(json["question5"]),
        question6: QuestionType1String.fromMap(json["question6"]),
        question7: QuestionType1String.fromMap(json["question7"]),
        question8: QuestionType1String.fromMap(json["question8"]),
        question9: QuestionType1String.fromMap(json["question9"]),
        test: IdHistory.fromMap(json["test"]),
      );
}

class QuestionType1String extends QuestionType1StringEntity {
  QuestionType1String({
    required String name,
    required String value,
  }) : super(name: name, value: value);

  factory QuestionType1String.fromMap(Map<String, dynamic> json) =>
      QuestionType1String(
        name: json["name"],
        value: json["value"],
      );
}

class QuestionType10List extends QuestionType10ListEntity {
  QuestionType10List({
    required String name,
    required List<String> value,
  }) : super(name: name, value: value);

  factory QuestionType10List.fromMap(Map<String, dynamic> json) =>
      QuestionType10List(
        name: json["name"],
        value: List<String>.from(json["value"].map((x) => x)),
      );
}

class TestAntigen extends TestAntigenEntity {
  TestAntigen({
    required IdHistory id,
    required List<dynamic> associatedTests,
    required IdHistory batch,
    required String code,
    required CreatedHistory created,
    required Object form,
    required List<dynamic> laboratory,
    required List<ManufacturerAntigen> manufacturer,
    required String photo,
    required IdHistory preparedBy,
    required IdHistory project,
    required Object result,
    required String sampleDate,
    required List<StatusHistory> status,
    required List<StatusTestHistory> statusHistory,
    required List<dynamic> stepHistory,
    required List<dynamic> swabType,
    required List<Symptom> symptoms,
    required List<TypeHistory> type,
    required CreatedHistory updated,
    required List<Vaccine> vaccines,
    required List<dynamic> validity,
  }) : super(
            id: id,
            associatedTests: associatedTests,
            batch: batch,
            code: code,
            created: created,
            form: form,
            laboratory: laboratory,
            manufacturer: manufacturer,
            photo: photo,
            preparedBy: preparedBy,
            project: project,
            result: result,
            sampleDate: sampleDate,
            status: status,
            statusHistory: statusHistory,
            stepHistory: stepHistory,
            swabType: swabType,
            symptoms: symptoms,
            type: type,
            updated: updated,
            vaccines: vaccines,
            validity: validity);

  factory TestAntigen.fromJson(String str) =>
      TestAntigen.fromMap(json.decode(str));

  factory TestAntigen.fromMap(Map<String, dynamic> json) => TestAntigen(
        id: IdHistory.fromMap(json["_id"]),
        associatedTests:
            List<dynamic>.from(json["associated_tests"].map((x) => x)),
        batch: IdHistory.fromMap(json["batch"]),
        code: json["code"],
        created: CreatedHistory.fromMap(json["created"]),
        form: List<dynamic>.from(json["form"].map((x) => x)),
        laboratory: List<dynamic>.from(json["laboratory"].map((x) => x)),
        manufacturer: List<ManufacturerAntigen>.from(
            json["manufacturer"].map((x) => ManufacturerAntigen.fromMap(x))),
        photo: json["photo"],
        preparedBy: IdHistory.fromMap(json["prepared_by"]),
        project: IdHistory.fromMap(json["project"]),
        result: List<dynamic>.from(json["result"].map((x) => x)),
        sampleDate: json["sample_date"],
        status: List<StatusHistory>.from(
            json["status"].map((x) => StatusHistory.fromMap(x))),
        statusHistory: List<StatusTestHistory>.from(
            json["status_history"].map((x) => StatusTestHistory.fromMap(x))),
        stepHistory: List<dynamic>.from(json["validity"].map((x) => x)),
        swabType: List<dynamic>.from(json["swab_type"].map((x) => x)),
        symptoms:
            List<Symptom>.from(json["symptoms"].map((x) => Symptom.fromMap(x))),
        type: List<TypeHistory>.from(
            json["type"].map((x) => TypeHistory.fromMap(x))),
        updated: CreatedHistory.fromMap(json["updated"]),
        vaccines:
            List<Vaccine>.from(json["vaccines"].map((x) => Vaccine.fromMap(x))),
        validity: List<dynamic>.from(json["validity"].map((x) => x)),
      );
}

class ManufacturerAntigen extends ManufacturerAntigenEntity {
  ManufacturerAntigen({
    required this.id,
    required this.name,
    required this.project,
    required this.testTime,
  }) : super(id: id, name: name, project: project, testTime: testTime);

  final IdHistory id;
  final String name;
  final IdHistory project;
  final int testTime;

  factory ManufacturerAntigen.fromMap(Map<String, dynamic> json) =>
      ManufacturerAntigen(
        id: IdHistory.fromMap(json["_id"]),
        name: json["name"],
        project: IdHistory.fromMap(json["project"]),
        testTime: json["test_time"],
      );
}

class Symptom extends SymptomEntity {
  Symptom({
    required Id id,
    required Id project,
    required String symptom,
  }) : super(id: id, project: project, symptom: symptom);

  factory Symptom.fromMap(Map<String, dynamic> json) => Symptom(
        id: Id.fromJson(json["_id"]),
        project: Id.fromJson(json["project"]),
        symptom: json["symptom"],
      );
}

class Vaccine extends VaccineEntity {
  Vaccine({
    required Id id,
    required Id project,
    required String vaccine,
  }) : super(
          id: id,
          project: project,
          vaccine: vaccine,
        );

  factory Vaccine.fromMap(Map<String, dynamic> json) => Vaccine(
        id: Id.fromJson(json["_id"]),
        project: Id.fromJson(json["project"]),
        vaccine: json["vaccine"],
      );
}
