class User {
  int? id;
  String? uid;
  String? name;
  String? email;
  dynamic mobile;
  String? password;
  String? role;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Business>? businesses;

  User(
      {this.id,
      this.uid,
      this.name,
      this.email,
      this.mobile,
      this.password,
      this.role,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.businesses});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    role = json['role'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    if (json['businesses'] != null) {
      businesses = <Business>[];
      json['businesses'].forEach((v) {
        businesses?.add(Business.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['password'] = password;
    data['role'] = role;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (businesses != null) {
      data['businesses'] = businesses?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Business {
  int? id;
  String? uid;
  String? name;
  String? address;
  String? city;
  String? state;
  String? country;
  int? pincode;
  String? mobile;
  dynamic altMobile;
  String? email;
  String? website;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Business(
      {this.id,
      this.uid,
      this.name,
      this.address,
      this.city,
      this.state,
      this.country,
      this.pincode,
      this.mobile,
      this.altMobile,
      this.email,
      this.website,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Business.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    mobile = json['mobile'];
    altMobile = json['altMobile'];
    email = json['email'];
    website = json['website'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['name'] = name;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
    data['mobile'] = mobile;
    data['altMobile'] = altMobile;
    data['email'] = email;
    data['website'] = website;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
