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
        message: json["message"],
        statusCode: json["statusCode"],
    );
}
