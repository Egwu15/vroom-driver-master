// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.success,
        this.data,
    });

    bool success;
    Data data;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.phoneNumber,
        this.status,
        this.agentLevel,
        this.activewithUser,
        this.picture,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.avater,
    });

    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    String phoneNumber;
    String status;
    String agentLevel;
    String activewithUser;
    dynamic picture;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;
    String avater;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phoneNumber: json["phoneNumber"],
        status: json["status"],
        agentLevel: json["agentLevel"],
        activewithUser: json["ActivewithUser"],
        picture: json["picture"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        avater: json["avater"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phoneNumber": phoneNumber,
        "status": status,
        "agentLevel": agentLevel,
        "ActivewithUser": activewithUser,
        "picture": picture,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "avater": avater,
    };
}
