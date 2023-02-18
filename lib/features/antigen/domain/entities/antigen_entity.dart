import 'package:personal_project/features/test_history/domain/entities/test_history_entity.dart';

class DataEntity {
    DataEntity({
        required this.lasttest,
        required this.testTime,
    });

    final LasttestEntity? lasttest;
    final int? testTime;
}

class LasttestEntity {
    LasttestEntity({
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

    final IdEntity? id;
    final CreatedEntity? created;
    final IdEntity? idTest;
    final String? ip;
    final Question1ClassEntity? question1;
    final Question10ClassEntity? question10;
    final Question10ClassEntity? question11;
    final Question10ClassEntity? question12;
    final Question1ClassEntity? question13;
    final Question1ClassEntity? question14;
    final Question1ClassEntity? question15;
    final Question10ClassEntity? question2;
    final Question1ClassEntity? question3;
    final Question1ClassEntity? question4;
    final Question1ClassEntity? question5;
    final Question1ClassEntity? question6;
    final Question1ClassEntity? question7;
    final Question1ClassEntity? question8;
    final Question1ClassEntity? question9;
    final CreatedEntity? updated;
}

class Question1ClassEntity {
    Question1ClassEntity({
        required this.name,
        required this.value,
    });

    final String? name;
    final String? value;
}

class Question10ClassEntity {
    Question10ClassEntity({
        required this.name,
        required this.value,
    });

    final String? name;
    final List<String>? value;
}
