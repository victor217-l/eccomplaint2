import 'dart:convert';

class User {
  final String id;
  final String name;
  final String password;
  final String email;
  final String age;
  final String surname;
  final String type;
  final List<dynamic> data;
  //final List<dynamic> cart;

  User(
      {required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.age,
        required this.surname,
        required this.type,
        required this.data,
        });

  Map<String, dynamic> toMap() {
    return {
      'data':data,
      'id': id,
      'name': name,
      'email': email,
      'surname': surname,
      'password': password,
      'address': age,
      'type': type,

      //'cart': cart,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
       data: List<MapEntry<dynamic, dynamic>>.from(map['data']?.map((x) => Map<dynamic, dynamic>.from(x))),
        id: map['_id'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        password: map['password'] ?? '',
      surname: map['surname'] ?? '',
        age: map['age'] ?? '',
        type: map['type'] ?? '',

      /*  cart: List<Map<String, dynamic>>.from(
          map['cart']?.map(
                (x) => Map<String, dynamic>.from(x),
          ),
        ) */
        );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}


