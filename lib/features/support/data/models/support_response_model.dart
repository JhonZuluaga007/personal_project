class SupportResponseModel {
  SupportResponseModel({
    required this.statusCode,
  });

  final int statusCode;

  factory SupportResponseModel.fromJson(Map<String, dynamic> json) =>
      SupportResponseModel(
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
      };
}

class Message {
  Message({
    required this.text,
    required this.type,
  });

  final String text;
  final String type;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "type": type,
      };
}
