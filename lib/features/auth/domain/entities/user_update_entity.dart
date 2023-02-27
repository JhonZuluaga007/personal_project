import 'dart:io';

import 'package:personal_project/features/auth/domain/entities/user_entity.dart';

class UserUpdateEntity {
  final String? userdId;
  final String? address;
  final String? city;
  final String? state;
  final String? zip;
  final RaceEntity? race;
  final EthnicityEntity? ethnicity;
  final SexEntity? sex;
  final GenderEntity? gender;
  final String? levelSchool;
  final String? file;

  UserUpdateEntity(
      {this.userdId,
      required this.address,
      required this.city,
      required this.state,
      required this.zip,
      required this.race,
      required this.ethnicity,
      required this.sex,
      required this.levelSchool,
      required this.gender,
      this.file});
}
