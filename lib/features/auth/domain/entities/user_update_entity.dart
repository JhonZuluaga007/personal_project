import 'package:Tellme/features/auth/domain/entities/options_tools_entity.dart';
import 'package:Tellme/features/auth/domain/entities/user_entity_login.dart';

class UserUpdateEntity {
  final String? userdId;
  final String? address;
  final String? city;
  final List<StateEntity>? state;
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
