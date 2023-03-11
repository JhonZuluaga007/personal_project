import 'dart:convert';

SupportModel supportModelFromJson(String str) =>
    SupportModel.fromJson(json.decode(str));

String supportModelToJson(SupportModel data) => json.encode(data.toJson());

class SupportModel {
  SupportModel({
    required this.project,
    required this.name,
    required this.email,
    required this.phone,
    required this.description,
    required this.supportImage,
  });

  final String project;
  final String name;
  final String email;
  final String phone;
  final String description;
  final String supportImage;

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        project: json["project"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        description: json["description"],
        supportImage: json["supportImage"],
      );

  Map<String, dynamic> toJson() => {
        "project": project,
        "name": name,
        "email": email,
        "phone": phone,
        "description": description,
        "supportImage": supportImage,
      };
}
