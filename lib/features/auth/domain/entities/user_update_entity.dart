import 'package:Tellme/features/auth/domain/entities/user_entity_login.dart';

class UserUpdateEntity {
  final String? userdId;
  final String? address;
  final String? city;
  final List<StateEntity>? state;
  final String? zip;
  final RaceEntity? race;
  final EthnicityEntity? ethnicity;
  final SexEntity? sex;
  final GenderEntity? gender;
  final SchoolLevelsEntity? levelSchool;
  final String? profileImage;

  UserUpdateEntity(
      {this.userdId,
      this.address,
      this.race,
      this.ethnicity,
      this.sex,
      this.levelSchool,
      this.gender,
      this.city,
      this.state,
      this.zip,
      this.profileImage});
}
