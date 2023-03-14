import 'dart:convert';

class ServerValidate{
    ServerValidate({
        required this.message,
        required this.statusCode,
    });

    final String message;
    final int statusCode;

    factory ServerValidate.fromJson(String str) => ServerValidate.fromMap(json.decode(str));

    factory ServerValidate.fromMap(Map<String, dynamic> json) => ServerValidate(
        message: MessageServerValidate.fromMap(json["message"]).text,
        statusCode: json["statusCode"],
    );
}

class MessageServerValidate {
    MessageServerValidate({
        required this.text,
        required this.type,
    });

    final String text;
    final String type;

    factory MessageServerValidate.fromMap(Map<String, dynamic> json) => MessageServerValidate(
        text: json["text"],
        type: json["type"],
    );
}
