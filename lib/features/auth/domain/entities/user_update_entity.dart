import 'user_entity_login.dart';
import 'options_tools_entity.dart';

class UserUpdateEntity {
  final String? userdId;
  final String? address;
  final String? city;
  final OpStatesEntity? state;
  final String? zip;
  final OpRaceEntity? race;
  final OpEthnicityEntity? ethnicity;
  final OpSexEntity? sex;
  final OpGenderEntity? gender;
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
