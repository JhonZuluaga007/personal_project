import 'dart:convert';

class ServerError {
  ServerError({
    required this.errorMessage,
    required this.statusCode,
  });

  Message errorMessage;
  int statusCode;

  factory ServerError.fromJson(String str) =>
      ServerError.fromMap(json.decode(str));

  factory ServerError.fromMap(Map<String, dynamic> json) => ServerError(
        errorMessage: Message.fromMap(json["message"]),
        statusCode: json["statusCode"],
      );
}

class Message {
  Message({
    required this.text,
    required this.type,
  });

  final String text;
  final String type;

  factory Message.fromJson(String str) => Message.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "type": type,
      };
}
