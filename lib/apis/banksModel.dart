// To parse this JSON data, do
//
//     final bankModel = bankModelFromJson(jsonString);

import 'dart:convert';

List<BankModel> bankModelFromJson(String str) => List<BankModel>.from(json.decode(str).map((x) => BankModel.fromJson(x)));

String bankModelToJson(List<BankModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BankModel {
    BankModel({
        this.name,
        this.slug,
        this.code,
        this.longcode,
        this.gateway,
        this.payWithBank,
        this.active,
        this.isDeleted,
        this.country,
        this.currency,
        this.type,
        this.id,
        this.createdAt,
        this.updatedAt,
    });

    String name;
    String slug;
    String code;
    String longcode;
    Gateway gateway;
    bool payWithBank;
    bool active;
    bool isDeleted;
    Country country;
    Currency currency;
    Type type;
    int id;
    DateTime createdAt;
    DateTime updatedAt;

    factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        longcode: json["longcode"],
        gateway: json["gateway"] == null ? null : gatewayValues.map[json["gateway"]],
        payWithBank: json["pay_with_bank"],
        active: json["active"],
        isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
        country: countryValues.map[json["country"]],
        currency: currencyValues.map[json["currency"]],
        type: typeValues.map[json["type"]],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "code": code,
        "longcode": longcode,
        "gateway": gateway == null ? null : gatewayValues.reverse[gateway],
        "pay_with_bank": payWithBank,
        "active": active,
        "is_deleted": isDeleted == null ? null : isDeleted,
        "country": countryValues.reverse[country],
        "currency": currencyValues.reverse[currency],
        "type": typeValues.reverse[type],
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

enum Country { NIGERIA }

final countryValues = EnumValues({
    "Nigeria": Country.NIGERIA
});

enum Currency { NGN }

final currencyValues = EnumValues({
    "NGN": Currency.NGN
});

enum Gateway { EMANDATE, IBANK, DIGITALBANKMANDATE }

final gatewayValues = EnumValues({
    "digitalbankmandate": Gateway.DIGITALBANKMANDATE,
    "emandate": Gateway.EMANDATE,
    "ibank": Gateway.IBANK
});

enum Type { NUBAN }

final typeValues = EnumValues({
    "nuban": Type.NUBAN
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
