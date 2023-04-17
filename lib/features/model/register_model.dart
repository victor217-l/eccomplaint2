import 'dart:convert';

class Register {
  final String id;
  //final String? username;
  final String? password;
  final String? email;
  final String? country;
  final String? type;

  //final List<dynamic> cart;

  Register(
      {
        required this.id,
       // required this.username,
        required this.email,
        required this.country,
        required this.password,
        required this.type,

      });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
     // 'username': username,
      'country': country,
      'password': password,
      'email': email,
        'type': type,
      //'cart': cart,
    };
  }

  factory Register.fromMap(Map<String, dynamic> map) {
    return Register(
      id: map['_id'] ?? '',
     // username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      country: map['country'] ?? '',
      type: map['type'] ?? '',

      /*  cart: List<Map<String, dynamic>>.from(
          map['cart']?.map(
                (x) => Map<String, dynamic>.from(x),
          ),
        ) */
    );
  }

  String toJson() => json.encode(toMap());

  factory Register.fromJson(String source) => Register.fromMap(json.decode(source));


}
/*
class Register {
  Register({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
    required this.meta,
  });

  final bool? success;
  final int? code;
  final String? message;
  final Data? data;
  final Meta? meta;

  factory Register.fromJson(Map<String, dynamic> json){
    return Register(
      success: json["success"],
      code: json["code"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class Data {
  Data({required this.json});
  final Map<String,dynamic> json;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
        json: json
    );
  }

}

class Meta {
  Meta({
    required this.status,
    required this.id,
    required this.message,
  });

  final int? status;
  final String? id;
  final String? message;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      status: json["status"],
      id: json["id"],
      message: json["message"],
    );
  }

} */