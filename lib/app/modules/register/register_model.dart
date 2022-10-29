import 'dart:convert';

class RegisterModel {
  String? fullname;
  String? email;
  String? password;

  RegisterModel({
    this.fullname,
    this.email,
    this.password,
  });

  RegisterModel copyWith({
    String? fullname,
    String? email,
    String? password,
  }) {
    return RegisterModel(
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'email': email,
      'password': password,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      fullname: map['fullname'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'RegisterModel(fullname: $fullname, email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterModel &&
        other.fullname == fullname &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => fullname.hashCode ^ email.hashCode ^ password.hashCode;
}
