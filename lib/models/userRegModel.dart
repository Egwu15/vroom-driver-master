// To parse this JSON data, do
//
//     final userRegisterdModel = userRegisterdModelFromJson(jsonString);

import 'dart:convert';

UserRegisterdModel userRegisterdModelFromJson(String str) => UserRegisterdModel.fromJson(json.decode(str));

String userRegisterdModelToJson(UserRegisterdModel data) => json.encode(data.toJson());

class UserRegisterdModel {
    UserRegisterdModel({
        this.status,
        this.messgae,
        this.token,
    });

    bool status;
    String messgae;
    String token;

    factory UserRegisterdModel.fromJson(Map<String, dynamic> json) => UserRegisterdModel(
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
