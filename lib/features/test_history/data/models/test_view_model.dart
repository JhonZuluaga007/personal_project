import 'dart:convert';
import 'package:personal_project/features/test_history/domain/entities/test_view_entity.dart';

class TestViewModel {
    TestViewModel({
        required this.data,
        required this.message,
        required this.statusCode,
    });

    final List<Data> data;
    final String message;
    final int statusCode;

    factory TestViewModel.fromJson(Map<String, dynamic> json) => TestViewModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromMap(x))),
        message: json["message"],
        statusCode: json["statusCode"],
    );
}

class Data extends TestViewEntity {
    Data({
      required Id id,
      required List<dynamic> associatedTests,
      required List<Batch> batch,
      required String code,
      required Created created,
      required Id form,
      required List<Form> forms,
      required List<Manufacturer> manufacturer,
      required List<String> photo,
      required List<Result> result,
      required Created sampleDate,
      required List<Status> status,
      required List<StatusHistory> statusHistory,
      required List<dynamic> statusHistoryAdmin,
      required String stepHistory,
      required Id swabType,
      required List<Type> type,
      required Created updated,
      required User user,
      required List<Validity> validity,
    }) : super(
      id: id, 
      associatedTests: associatedTests, 
      batch: batch, 
      code: code, 
      created: created, 
      form: form, 
      forms: forms, 
      manufacturer: manufacturer, 
      photo: photo, 
      result: result, 
      sampleDate: sampleDate, 
      status: status, 
      statusHistory: statusHistory, 
      statusHistoryAdmin: statusHistoryAdmin, 
      stepHistory: stepHistory, 
      swabType: swabType, 
      type: type, 
      updated: updated, 
      user: user, 
      validity: validity
    );

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: Id.fromMap(json["_id"]),
        associatedTests: List<dynamic>.from(json["associated_tests"].map((x) => x)),
        batch: List<Batch>.from(json["batch"].map((x) => Batch.fromMap(x))),
        code: json["code"],
        created: Created.fromMap(json["created"]),
        form: Id.fromMap(json["form"]),
        forms: List<Form>.from(json["forms"].map((x) => Form.fromMap(x))),
        manufacturer: List<Manufacturer>.from(json["manufacturer"].map((x) => Manufacturer.fromMap(x))),
        photo: List<String>.from(json["photo"].map((x) => x)),
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
        sampleDate: Created.fromMap(json["sample_date"]),
        status: List<Status>.from(json["status"].map((x) => Status.fromMap(x))),
        statusHistory: List<StatusHistory>.from(json["status_history"].map((x) => StatusHistory.fromMap(x))),
        statusHistoryAdmin: List<dynamic>.from(json["status_history_admin"].map((x) => x)),
        stepHistory: json["step_history"],
        swabType: Id.fromMap(json["swab_type"]),
        type: List<Type>.from(json["type"].map((x) => Type.fromMap(x))),
        updated: Created.fromMap(json["updated"]),
        user: User.fromMap(json["user"]),
        validity: List<Validity>.from(json["validity"].map((x) => Validity.fromMap(x))),
    );
}

class Batch extends BatchViewEntity {
    Batch({
      required Id id,
      required Created created,
      required String description,
      required Id manufacturer,
      required Id preparedBy,
      required int quantity,
      required Id status,
      required Id swabType,
      required Id type,
      required Created updated,
    }) : super(
      id: id, 
      created: created, 
      description: description, 
      manufacturer: manufacturer, 
      preparedBy: preparedBy, 
      quantity: quantity, 
      status: status, 
      swabType: swabType, 
      type: type, 
      updated: updated
    );

    factory Batch.fromMap(Map<String, dynamic> json) => Batch(
        id: Id.fromMap(json["_id"]),
        created: Created.fromMap(json["created"]),
        description: json["description"],
        manufacturer: Id.fromMap(json["manufacturer"]),
        preparedBy: Id.fromMap(json["prepared_by"]),
        quantity: json["quantity"],
        status: Id.fromMap(json["status"]),
        swabType: Id.fromMap(json["swab_type"]),
        type: Id.fromMap(json["type"]),
        updated: Created.fromMap(json["updated"]),
    );
}

class Created extends CreatedViewEntity {
    Created({
        required DateTime date,
    }) : super(
      date: date
    );

    factory Created.fromJson(String str) => Created.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Created.fromMap(Map<String, dynamic> json) => Created(
        date: DateTime.parse(json["\u0024date"]),
    );

    Map<String, dynamic> toMap() => {
        "\u0024date": date.toIso8601String(),
    };
}

class Id extends IdViewEntity {
    Id({
        required  String oid,
    }) : super(
      oid: oid
    );

    factory Id.fromJson(String str) => Id.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Id.fromMap(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
    );

    Map<String, dynamic> toMap() => {
        "\u0024oid": oid,
    };
}

class Form extends FormViewEntity {
    Form({
      required Id id,
      required CreatedViewEntity created,
      required Id idTest,
      required String ip,
      required Question1Class question1,
      required Question10Class question10,
      required Question10Class question11,
      required Question10Class question12,
      required Question1Class question13,
      required Question1Class question14,
      required Question1Class question15,
      required Question10Class question2,
      required Question1Class question3,
      required Question1Class question4,
      required Question1Class question5,
      required Question1Class question6,
      required Question1Class question7,
      required Question1Class question8,
      required Question1Class question9,
      required CreatedViewEntity updated,
    }) : super(
      id: id, 
      created: created, 
      idTest: idTest, 
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
      updated: updated
    );

    factory Form.fromMap(Map<String, dynamic> json) => Form(
        id: Id.fromMap(json["_id"]),
        created: Created.fromMap(json["created"]),
        idTest: Id.fromMap(json["idTest"]),
        ip: json["ip"],
        question1: Question1Class.fromMap(json["question1"]),
        question10: Question10Class.fromMap(json["question10"]),
        question11: Question10Class.fromMap(json["question11"]),
        question12: Question10Class.fromMap(json["question12"]),
        question13: Question1Class.fromMap(json["question13"]),
        question14: Question1Class.fromMap(json["question14"]),
        question15: Question1Class.fromMap(json["question15"]),
        question2: Question10Class.fromMap(json["question2"]),
        question3: Question1Class.fromMap(json["question3"]),
        question4: Question1Class.fromMap(json["question4"]),
        question5: Question1Class.fromMap(json["question5"]),
        question6: Question1Class.fromMap(json["question6"]),
        question7: Question1Class.fromMap(json["question7"]),
        question8: Question1Class.fromMap(json["question8"]),
        question9: Question1Class.fromMap(json["question9"]),
        updated: Created.fromMap(json["updated"]),
    );
}

class Question1Class extends Question10ClassViewEntity {
    Question1Class({
      required String name,
      required List<String> value,
    }) : super(
      name: name, 
      value: value
    );

    factory Question1Class.fromJson(String str) => Question1Class.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Question1Class.fromMap(Map<String, dynamic> json) => Question1Class(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "value": value,
    };
}

class Question10Class extends Question10ClassViewEntity {
    Question10Class({
      required final String name,
      required List<String> value,
    }) : super(
      name: name, 
      value: value
    );

    factory Question10Class.fromJson(String str) => Question10Class.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Question10Class.fromMap(Map<String, dynamic> json) => Question10Class(
        name: json["name"],
        value: List<String>.from(json["value"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "value": List<dynamic>.from(value.map((x) => x)),
    };
}

class Manufacturer extends ManufacturerViewEntity {
    Manufacturer({
      required Id id,
      required String name,
      required int testTime,
    }) : super(
      id: id, 
      name: name, 
      testTime: testTime
    );

    factory Manufacturer.fromMap(Map<String, dynamic> json) => Manufacturer(
        id: Id.fromMap(json["_id"]),
        name: json["name"],
        testTime: json["test_time"],
    );
}

class Result extends ResultViewEntity {
    Result({
      required Id id,
      required String result,
    }) : super(
      id: id,
      result: result,
    );

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: Id.fromMap(json["_id"]),
        result: json["result"],
    );
}

class Status extends StatusViewEntity {
    Status({
      required Id id,
      required String status,
    }) : super(
      id: id, 
      status: status
    );

    factory Status.fromMap(Map<String, dynamic> json) => Status(
        id: Id.fromMap(json["_id"]),
        status: json["status"],
    );
}

class StatusHistory extends StatusHistoryViewEntity {
    StatusHistory({
      required CreatedViewEntity date,
      required String status,
    }) : super(
      date: date,
      status: status
    );

    factory StatusHistory.fromMap(Map<String, dynamic> json) => StatusHistory(
        date: Created.fromMap(json["date"]),
        status: json["status"],
    );
}

class Type extends TypeViewEntity {
    Type({
      required Id id,
      required bool hasBandType,
      required bool hasGeneCycle,
      required String testLetter,
      required String type,
    }) : super(
      id: id, 
      hasBandType: hasBandType, 
      hasGeneCycle: hasGeneCycle, 
      testLetter: testLetter, 
      type: type
    );

    factory Type.fromMap(Map<String, dynamic> json) => Type(
        id: Id.fromMap(json["_id"]),
        hasBandType: json["has_band_type"],
        hasGeneCycle: json["has_gene_cycle"],
        testLetter: json["test_letter"],
        type: json["type"],
    );
}

class User extends UserViewEntity {
    User({
      required IdViewEntity id,
      required bool acceptsTerms,
      required AddressesViewEntity addresses,
      required String cellphone,
      required CreatedViewEntity dateOfBirth,
      required String email,
      required IdViewEntity ethnicity,
      required IdViewEntity gender,
      required String image,
      required bool informationUpdated,
      required bool isActive,
      required bool isConfirmed,
      required String lastname,
      required dynamic levelSchool,
      required String loginId,
      required String middleName,
      required String name,
      required dynamic organization,
      required String participantId,
      required String password,
      required bool passwordReset,
      required List<dynamic> projects,
      required IdViewEntity race,
      required List<IdViewEntity> roles,
      required IdViewEntity sex,
      required CreatedViewEntity updated,
    }) : super(
      id: id, 
      acceptsTerms: acceptsTerms, 
      addresses: addresses, 
      cellphone: cellphone, 
      dateOfBirth: dateOfBirth, 
      email: email, 
      ethnicity: ethnicity, 
      gender: gender, 
      image: image, 
      informationUpdated: informationUpdated, 
      isActive: isActive, 
      isConfirmed: isConfirmed, 
      lastname: lastname, 
      levelSchool: levelSchool, 
      loginId: loginId, 
      middleName: middleName, 
      name: name, 
      organization: organization, 
      participantId: participantId, 
      password: password, 
      passwordReset: passwordReset, 
      projects: projects, 
      race: race, 
      roles: roles, 
      sex: sex, 
      updated: updated
    );

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: Id.fromMap(json["_id"]),
        acceptsTerms: json["accepts_terms"],
        addresses: Addresses.fromMap(json["addresses"]),
        cellphone: json["cellphone"],
        dateOfBirth: Created.fromMap(json["date_of_birth"]),
        email: json["email"],
        ethnicity: Id.fromMap(json["ethnicity"]),
        gender: Id.fromMap(json["gender"]),
        image: json["image"],
        informationUpdated: json["information_updated"],
        isActive: json["is_active"],
        isConfirmed: json["is_confirmed"],
        lastname: json["lastname"],
        levelSchool: json["level_school"],
        loginId: json["login_id"],
        middleName: json["middle_name"],
        name: json["name"],
        organization: json["organization"],
        participantId: json["participant_id"],
        password: json["password"],
        passwordReset: json["password_reset"],
        projects: List<dynamic>.from(json["projects"].map((x) => x)),
        race: Id.fromMap(json["race"]),
        roles: List<Id>.from(json["roles"].map((x) => Id.fromMap(x))),
        sex: Id.fromMap(json["sex"]),
        updated: Created.fromMap(json["updated"]),
    );
}

class Addresses extends AddressesViewEntity {
    Addresses({
      required String address,
      required String city,
      required String state,
      required String zip,
    }) : super(
      address: address, 
      city: city, 
      state: state,
      zip: zip
    );

    factory Addresses.fromJson(String str) => Addresses.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Addresses.fromMap(Map<String, dynamic> json) => Addresses(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
    );

    Map<String, dynamic> toMap() => {
        "address": address,
        "city": city,
        "state": state,
        "zip": zip,
    };
}

class Validity extends ValidityViewEntity {
    Validity({
      required IdViewEntity id,
      required String validity,
    }) : super(
      id: id, 
      validity: validity
    );

    factory Validity.fromMap(Map<String, dynamic> json) => Validity(
        id: Id.fromMap(json["_id"]),
        validity: json["validity"],
    );
}
