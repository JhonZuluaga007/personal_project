class MedicalHistoryEntity {
  MedicalHistoryEntity({
    required this.id,
    required this.created,
    required this.question1,
    required this.question2,
    required this.status,
    required this.updated,
    required this.userId,
  });

  final String? id;
  final AtedEntity? created;
  final Question1Entity? question1;
  final Question2Entity? question2;
  final bool? status;
  final AtedEntity? updated;
  final UserIdEntity? userId;
}

class AtedEntity {
  AtedEntity({
    required this.date,
  });

  final DateTime date;
}

class Question1Entity {
  Question1Entity({
    required this.name,
    required this.value,
  });

  final String name;
  late String value;
}

class Question2Entity {
  Question2Entity({
    required this.name,
    required this.value,
  });

  final String name;
  late List<String> value;
}

class UserIdEntity {
  UserIdEntity({
    required this.oid,
  });

  final String oid;
}
