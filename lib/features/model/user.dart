import 'dart:convert';
/*
User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.role,
    required this.id,
    // required this.firstname,
    // required this.lastname,
    required this.email,
    required this.password,
    required this.avatar,
    required this.coverPhoto,
    required this.resetPasswordPin,
    required this.active,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.deletedAt, required String name,
  });

  Role role;
  String id;
  // String firstname;
  // String lastname;
  String email;
  String password;
  String avatar;
  String coverPhoto;
  String resetPasswordPin;
  bool active;
  bool verified;
  DateTime createdAt;
  DateTime updatedAt;
  String? deletedAt;
  int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        role: Role.fromJson(json["role"]),
        id: json["_id"],
        // firstname: json["firstname"],
        // lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        avatar: json["avatar"],
        coverPhoto: json["cover_photo"],
        resetPasswordPin: json["reset_password_pin"],
        active: json["active"],
        verified: json["verified"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deleted_at"] ?? '',
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "role": role.toJson(),
        "_id": id,
        // "firstname": firstname,
        // "lastname": lastname,
        "email": email,
        "password": password,
        "avatar": avatar,
        "cover_photo": coverPhoto,
        "reset_password_pin": resetPasswordPin,
        "active": active,
        "verified": verified,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deleted_at": deletedAt ?? '',
        "__v": v,
      };
}

class Role {
  Role({
    required this.type,
    required this.id,
  });

  String type;
  int id;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
      };
}
*/