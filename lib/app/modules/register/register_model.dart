class Register {
  int? id;
  String? uid;
  String? name;
  String? email;
  String? password;
  String? role;
  bool? isActive;

  Register({
    this.id,
    this.uid,
    this.name,
    this.email,
    this.password,
    this.role,
    this.isActive,
  });

  Register.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    data['isActive'] = isActive;
    return data;
  }
}
