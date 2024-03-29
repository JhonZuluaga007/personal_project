import '../../domain/entities/user_entity_login.dart';
import '../../../test_history/data/models/test_history_models.dart';

class UserModelLogin extends UserEntityLogin {
  UserModelLogin({
    required Data data,
    required Message message,
    required int statusCode,
  }) : super(
          data: data,
          message: message,
          statusCode: statusCode,
        );

  factory UserModelLogin.fromJson(Map<String, dynamic> json) => UserModelLogin(
        data: Data.fromJson(json["data"]),
        message: Message.fromJson(json["message"]),
        statusCode: json["statusCode"],
      );
}

class Data extends DataEntity {
  Data({
    required Project project,
    required String token,
    required User user,
  }) : super(
          project: project,
          token: token,
          user: user,
        );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        project: json["project"] != null
            ? Project.fromJson(json["project"])
            : Project(
                id: Id(oid: ''),
                // description: Description(numberDouble: ''),
                // disease: [],
                isActive: false,
                logo: Description(numberDouble: ''),
                project: '',
                type: [],
                url: ''),
        token: json["token"] ?? '',
        user: User.fromJson(json["user"]),
      );
}

class Project extends ProjectEntity {
  Project({
    required Id id,
    // required Description description,
    // required List<dynamic> disease,
    required bool isActive,
    required Description logo,
    required String project,
    required List<Type> type,
    required String url,
  }) : super(
            id: id,
            // description: description,
            // disease: disease,
            isActive: isActive,
            logo: logo,
            project: project,
            type: type,
            url: url);

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: Id.fromJson(json["_id"]),
        // description: Description.fromJson(json["description"]),
        // disease:  json["disease"] /*List<String>.from(json["disease"].map((x) => x)),*/,
        isActive: json["is_active"],
        logo: Description.fromJson(json["logo"]),
        project: json["project"],
        type: List<Type>.from(json["type"].map((x) => Type.fromJson(x))),
        url: json["url"],
      );
}

class Description extends DescriptionEntity {
  Description({
    required String numberDouble,
  }) : super(
          numberDouble: numberDouble,
        );

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        numberDouble: json["\u0024numberDouble"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024numberDouble": numberDouble,
      };
}

class Id extends IdEntity {
  Id({
    required String oid,
  }) : super(oid: oid);

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

class Type extends TypeEntity {
  Type({
    required Id id,
    required String type,
    required bool userRegistrationAvailable,
  }) : super(
          id: id,
          type: type,
          userRegistrationAvailable: userRegistrationAvailable,
        );

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: Id.fromJson(json["_id"]),
        type: json["type"],
        userRegistrationAvailable: json["user_registration_available"],
      );
}

class User extends UserEntity {
  User({
    required Id id,
    required bool acceptsTerms,
    required Address address,
    required String cellphone,
    required String dateOfBirth,
    required String email,
    required List<Ethnicity> ethnicity,
    required bool firstLogin,
    required List<Gender> gender,
    required bool informationUpdated,
    required bool isActive,
    required bool isConfirmed,
    required String lastname,
    required String loginId,
    required String middleName,
    required String name,
    required String participantId,
    required String password,
    required bool passwordReset,
    required String profileImage,
    required List<IdHistory> projects,
    required List<Race> race,
    required List<String> roles,
    //required List<String> schoolLevel,
    required List<SchoolLevels> schoolLevels,
    required List<Sex> sex,
  }) : super(
          id: id,
          acceptsTerms: acceptsTerms,
          address: address,
          cellphone: cellphone,
          dateOfBirth: dateOfBirth,
          email: email,
          ethnicity: ethnicity,
          firstLogin: firstLogin,
          gender: gender,
          informationUpdated: informationUpdated,
          isActive: isActive,
          isConfirmed: isConfirmed,
          lastname: lastname,
          loginId: loginId,
          middleName: middleName,
          name: name,
          participantId: participantId,
          password: password,
          passwordReset: passwordReset,
          profileImage: profileImage,
          projects: projects,
          race: race,
          roles: roles,
          //schoolLevel: schoolLevel,
          schoolLevels: schoolLevels,
          sex: sex,
        );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: Id.fromJson(json["_id"]),
        acceptsTerms: json["accepts_terms"],
        address: Address.fromJson(json["address"]),
        cellphone: json["cellphone"],
        dateOfBirth: json[
            "date_of_birth"] /*DateOfBirth.fromJson(json["date_of_birth"])*/,
        email: json["email"],
        ethnicity: List<Ethnicity>.from(
            json["ethnicity"].map((x) => Ethnicity.fromJson(x))),
        firstLogin: json["first_login"],
        gender:
            List<Gender>.from(json["gender"].map((x) => Gender.fromJson(x))),
        informationUpdated: json["information_updated"],
        isActive: json["is_active"],
        isConfirmed: json["is_confirmed"],
        lastname: json["lastname"],
        loginId: json["login_id"],
        middleName: json["middle_name"],
        name: json["name"],
        participantId: json["participant_id"],
        password: json["password"],
        passwordReset: json["password_reset"],
        profileImage: json["profile_image"],
        projects: List<IdHistory>.from(
            json["projects"].map((x) => IdHistory.fromMap(x))),
        race: List<Race>.from(json["race"].map((x) => Race.fromJson(x))),
        roles: List<String>.from(json["roles"].map((x) => x)),
        //schoolLevel: List<String>.from(json["school_level"].map((x) => x)),
        schoolLevels: json["school_levels"] != null
            ? List<SchoolLevels>.from(
                json["school_levels"].map((x) => SchoolLevels.fromJson(x)))
            : [],
        sex: List<Sex>.from(json["sex"].map((x) => Sex.fromJson(x))),
      );
}

class Address extends AddressEntity {
  Address({
    required String address,
    required String city,
    required List<State> state,
    required String zip,
  }) : super(
          address: address,
          city: city,
          state: state,
          zip: zip,
        );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"] ?? '',
        city: json["city"] ?? '',
        state: List<State>.from(json["state"].map((x) => State.fromJson(x))),
        zip: json["zip"] ?? '',
      );
}

class SchoolLevels extends SchoolLevelsEntity {
  SchoolLevels({
    required IdHistory id,
    required String level,
    required int order,
    required IdHistory project,
  }) : super(
          id: id,
          level: level,
          order: order,
          project: project,
        );

  factory SchoolLevels.fromJson(Map<String, dynamic> json) => SchoolLevels(
        id: json["_id"] != null
            ? IdHistory.fromMap(json["_id"])
            : IdHistory(oid: ""),
        level: json["level"] ?? "",
        order: json["order"] ?? 1,
        project: json["project"] != null
            ? IdHistory.fromMap(json["project"])
            : IdHistory(oid: ""),
      );
}

class State extends StateEntity {
  State({
    required IdHistory id,
    required String ethnicity,
  }) : super(
          id: id,
          state: ethnicity,
        );

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: IdHistory.fromMap(json["_id"]),
        ethnicity: json["state"],
      );
}

class DateOfBirth extends DateOfBirthEntity {
  DateOfBirth({
    required DateTime date,
  }) : super(date: date);

  factory DateOfBirth.fromJson(Map<String, dynamic> json) => DateOfBirth(
        date: DateTime.parse(json["\u0024date"]),
      );

  Map<String, dynamic> toJson() => {
        "\u0024date": date.toIso8601String(),
      };
}

class Ethnicity extends EthnicityEntity {
  Ethnicity({
    required IdHistory id,
    required String ethnicity,
  }) : super(
          id: id,
          ethnicity: ethnicity,
        );

  factory Ethnicity.fromJson(Map<String, dynamic> json) => Ethnicity(
        id: IdHistory.fromMap(json["_id"]),
        ethnicity: json["ethnicity"],
      );
}

class Gender extends GenderEntity {
  Gender({
    required IdHistory id,
    required String gender,
  }) : super(
          id: id,
          gender: gender,
        );

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: IdHistory.fromMap(json["_id"]),
        gender: json["gender"],
      );
}

class Race extends RaceEntity {
  Race({
    required IdHistory id,
    required String race,
  }) : super(
          id: id,
          race: race,
        );

  factory Race.fromJson(Map<String, dynamic> json) => Race(
        id: IdHistory.fromMap(json["_id"]),
        race: json["race"],
      );
}

class Sex extends SexEntity {
  Sex({
    required IdHistory id,
    required String sex,
  }) : super(
          id: id,
          sex: sex,
        );

  factory Sex.fromJson(Map<String, dynamic> json) => Sex(
        id: IdHistory.fromMap(json["_id"]),
        sex: json["sex"],
      );
}

class Message extends MessageEntity {
  Message({
    required String text,
    required String type,
  }) : super(
          text: text,
          type: type,
        );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "type": type,
      };
}
