// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
    AuthModel({
        this.status,
        this.messgae,
        this.token,
    });

    bool status;
    String messgae;
    String token;

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        status: json["status"],
        messgae: json["messgae"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "messgae": messgae,
        "token": token,
    };
}
