// To parse this JSON data, do
//
//     final testViewEntity = testViewEntityFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import '../../data/models/test_view_model.dart';

class TestViewEntity {
    TestViewEntity({
        required this.id,
        required this.associatedTests,
        required this.batch,
        required this.code,
        required this.created,
        required this.form,
        required this.forms,
        required this.manufacturer,
        required this.photo,
        required this.result,
        required this.sampleDate,
        required this.status,
        required this.statusHistory,
        required this.statusHistoryAdmin,
        required this.stepHistory,
        required this.swabType,
        required this.type,
        required this.updated,
        required this.user,
        required this.validity,
    });

    final IdViewEntity id;
    final List<dynamic> associatedTests;
    final List<Batch> batch;
    final String code;
    final CreatedViewEntity created;
    final IdViewEntity form;
    final List<Form> forms;
    final List<Manufacturer> manufacturer;
    final List<String> photo;
    final List<Result> result;
    final CreatedViewEntity sampleDate;
    final List<Status> status;
    final List<StatusHistory> statusHistory;
    final List<dynamic> statusHistoryAdmin;
    final String stepHistory;
    final IdViewEntity swabType;
    final List<TypeViewEntity> type;
    final CreatedViewEntity updated;
    final UserViewEntity user;
    final List<ValidityViewEntity> validity;
}

class BatchViewEntity {
    BatchViewEntity({
        required this.id,
        required this.created,
        required this.description,
        required this.manufacturer,
        required this.preparedBy,
        required this.quantity,
        required this.status,
        required this.swabType,
        required this.type,
        required this.updated,
    });

    final IdViewEntity id;
    final CreatedViewEntity created;
    final String description;
    final IdViewEntity manufacturer;
    final IdViewEntity preparedBy;
    final int quantity;
    final IdViewEntity status;
    final IdViewEntity swabType;
    final IdViewEntity type;
    final CreatedViewEntity updated;
}

class CreatedViewEntity {
    CreatedViewEntity({
        required this.date,
    });

    final DateTime date;
}

class IdViewEntity {
    IdViewEntity({
        required this.oid,
    });

    final String oid;
}

class FormViewEntity {
    FormViewEntity({
        required this.id,
        required this.created,
        required this.idTest,
        required this.ip,
        required this.question1,
        required this.question10,
        required this.question11,
        required this.question12,
        required this.question13,
        required this.question14,
        required this.question15,
        required this.question2,
        required this.question3,
        required this.question4,
        required this.question5,
        required this.question6,
        required this.question7,
        required this.question8,
        required this.question9,
        required this.updated,
    });

    final IdViewEntity id;
    final CreatedViewEntity created;
    final IdViewEntity idTest;
    final String ip;
    final Question1Class question1;
    final Question10Class question10;
    final Question10Class question11;
    final Question10Class question12;
    final Question1Class question13;
    final Question1Class question14;
    final Question1Class question15;
    final Question10Class question2;
    final Question1Class question3;
    final Question1Class question4;
    final Question1Class question5;
    final Question1Class question6;
    final Question1Class question7;
    final Question1Class question8;
    final Question1Class question9;
    final CreatedViewEntity updated;
}

class Question1ClassViewEntity {
    Question1ClassViewEntity({
        required this.name,
        required this.value,
    });

    final String name;
    final String value;
}

class Question10ClassViewEntity {
    Question10ClassViewEntity({
        required this.name,
        required this.value,
    });

    final String name;
    final List<String> value;
}

class ManufacturerViewEntity {
    ManufacturerViewEntity({
        required this.id,
        required this.name,
        required this.testTime,
    });

    final IdViewEntity id;
    final String name;
    final int testTime;
}

class ResultViewEntity {
    ResultViewEntity({
        required this.id,
        required this.result,
    });

    final IdViewEntity id;
    final String result;
}

class StatusViewEntity {
    StatusViewEntity({
        required this.id,
        required this.status,
    });

    final IdViewEntity id;
    final String status;
}

class StatusHistoryViewEntity {
    StatusHistoryViewEntity({
        required this.date,
        required this.status,
    });

    final CreatedViewEntity date;
    final String status;
}

class TypeViewEntity {
    TypeViewEntity({
        required this.id,
        required this.hasBandType,
        required this.hasGeneCycle,
        required this.testLetter,
        required this.type,
    });

    final IdViewEntity id;
    final bool hasBandType;
    final bool hasGeneCycle;
    final String testLetter;
    final String type;
}

class UserViewEntity {
    UserViewEntity({
        required this.id,
        required this.acceptsTerms,
        required this.addresses,
        required this.cellphone,
        required this.dateOfBirth,
        required this.email,
        required this.ethnicity,
        required this.gender,
        required this.image,
        required this.informationUpdated,
        required this.isActive,
        required this.isConfirmed,
        required this.lastname,
        required this.levelSchool,
        required this.loginId,
        required this.middleName,
        required this.name,
        required this.organization,
        required this.participantId,
        required this.password,
        required this.passwordReset,
        required this.projects,
        required this.race,
        required this.roles,
        required this.sex,
        required this.updated,
    });

    final IdViewEntity id;
    final bool acceptsTerms;
    final AddressesViewEntity addresses;
    final String cellphone;
    final CreatedViewEntity dateOfBirth;
    final String email;
    final IdViewEntity ethnicity;
    final IdViewEntity gender;
    final String image;
    final bool informationUpdated;
    final bool isActive;
    final bool isConfirmed;
    final String lastname;
    final dynamic levelSchool;
    final String loginId;
    final String middleName;
    final String name;
    final dynamic organization;
    final String participantId;
    final String password;
    final bool passwordReset;
    final List<dynamic> projects;
    final IdViewEntity race;
    final List<IdViewEntity> roles;
    final IdViewEntity sex;
    final CreatedViewEntity updated;
}

class AddressesViewEntity {
    AddressesViewEntity({
        required this.address,
        required this.city,
        required this.state,
        required this.zip,
    });

    final String address;
    final String city;
    final String state;
    final String zip;
}

class ValidityViewEntity {
    ValidityViewEntity({
        required this.id,
        required this.validity,
    });

    final IdViewEntity id;
    final String validity;
}
