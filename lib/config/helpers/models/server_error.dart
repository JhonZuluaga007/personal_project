import 'dart:convert';

class ServerError {
    ServerError({
        required this.errorMessage,
        required this.statusCode,
    });

    String errorMessage;
    int statusCode;

    String toJson() => json.encode(toMap());

    factory ServerError.fromMap(Map<String, dynamic> json) => ServerError(
        errorMessage: json["message"],
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toMap() => {
        "message": errorMessage,
        "statusCode": statusCode,
    };
}
