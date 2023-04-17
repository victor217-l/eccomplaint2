class Register {
  Register({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.deviceId,
  });

  final String? firstname;
  final String? lastname;
  final String? email;
  final String? password;
  final String? deviceId;

  factory Register.fromJson(Map<String, dynamic> json){
    return Register(
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      password: json["password"],
      deviceId: json["deviceId"],
    );
  }

}
