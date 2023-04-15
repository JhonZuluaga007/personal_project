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
        errorMessage: json["message"] != null ? Message.fromMap(json["message"]) : Message(text: 'error', type: ''),
        statusCode: json["statusCode"] !=null ? json["statusCode"] : 404,
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
