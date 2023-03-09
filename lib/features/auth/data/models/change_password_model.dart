class ChangePasswordModel {
  ChangePasswordModel({
    required this.data,
    required this.message,
  });

  final ChangePasswordData data;
  final Message message;

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordModel(
        data: ChangePasswordData.fromJson(json["data"]),
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message.toJson(),
      };
}

class ChangePasswordData {
  ChangePasswordData();

  factory ChangePasswordData.fromJson(Map<String, dynamic> json) =>
      ChangePasswordData();

  Map<String, dynamic> toJson() => {};
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
