class UserUpdateEntity {
  final String? userdId;
  final String? address;
  final String? city;
  final String? state;
  final String? zip;
  final String? race;
  final String? ethnicity;
  final String? sex;
  final String? gender;
  final String? file;

  UserUpdateEntity({
    this.userdId,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.race,
    required this.ethnicity,
    required this.sex,
    required this.gender,
    this.file
  });
}
