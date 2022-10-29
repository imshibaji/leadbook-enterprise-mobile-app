class Lead {
  int? id;
  dynamic uid;
  String? purpose;
  String? name;
  String? email;
  String? mobile;
  dynamic altMobile;
  String? source;
  String? status;
  List<Businesses>? businesses;
  List<Followups>? followups;
  List<Deals>? deals;

  Lead(
      {this.id,
      this.uid,
      this.purpose,
      this.name,
      this.email,
      this.mobile,
      this.altMobile,
      this.source,
      this.status,
      this.businesses,
      this.followups,
      this.deals});

  Lead.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    purpose = json['purpose'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    altMobile = json['altMobile'];
    source = json['source'];
    status = json['status'];
    if (json['businesses'] != null) {
      businesses = <Businesses>[];
      json['businesses'].forEach((v) {
        businesses?.add(Businesses.fromJson(v));
      });
    }
    if (json['followups'] != null) {
      followups = <Followups>[];
      json['followups'].forEach((v) {
        followups?.add(Followups.fromJson(v));
      });
    }
    if (json['deals'] != null) {
      deals = <Deals>[];
      json['deals'].forEach((v) {
        deals?.add(Deals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['purpose'] = purpose;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['altMobile'] = altMobile;
    data['source'] = source;
    data['status'] = status;
    if (businesses != null) {
      data['businesses'] = businesses?.map((v) => v.toJson()).toList();
    }
    if (followups != null) {
      data['followups'] = followups?.map((v) => v.toJson()).toList();
    }
    if (deals != null) {
      data['deals'] = deals?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Businesses {
  int? id;
  dynamic uid;
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

  Businesses(
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

  Businesses.fromJson(Map<String, dynamic> json) {
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

class Followups {
  int? id;
  dynamic uid;
  String? discuss;
  String? status;
  String? schedule;
  String? leadUid;
  bool? isDone;

  Followups(
      {this.id,
      this.uid,
      this.discuss,
      this.status,
      this.schedule,
      this.leadUid,
      this.isDone});

  Followups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    discuss = json['discuss'];
    status = json['status'];
    schedule = json['schedule'];
    leadUid = json['leadUid'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['discuss'] = discuss;
    data['status'] = status;
    data['schedule'] = schedule;
    data['leadUid'] = leadUid;
    data['isDone'] = isDone;
    return data;
  }
}

class Deals {
  int? id;
  dynamic uid;
  String? name;
  String? details;
  int? price;
  int? discount;
  String? status;
  String? createdAt;
  dynamic leadUid;
  List<Orders>? orders;

  Deals(
      {this.id,
      this.uid,
      this.name,
      this.details,
      this.price,
      this.discount,
      this.status,
      this.createdAt,
      this.leadUid,
      this.orders});

  Deals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    details = json['details'];
    price = json['price'];
    discount = json['discount'];
    status = json['status'];
    createdAt = json['createdAt'];
    leadUid = json['leadUid'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['name'] = name;
    data['details'] = details;
    data['price'] = price;
    data['discount'] = discount;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['leadUid'] = leadUid;
    if (orders != null) {
      data['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  dynamic uid;
  String? name;
  String? details;
  int? price;
  int? discount;
  int? quantity;
  String? unit;
  int? total;
  dynamic dealUid;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Orders(
      {this.id,
      this.uid,
      this.name,
      this.details,
      this.price,
      this.discount,
      this.quantity,
      this.unit,
      this.total,
      this.dealUid,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    details = json['details'];
    price = json['price'];
    discount = json['discount'];
    quantity = json['quantity'];
    unit = json['unit'];
    total = json['total'];
    dealUid = json['dealUid'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['name'] = name;
    data['details'] = details;
    data['price'] = price;
    data['discount'] = discount;
    data['quantity'] = quantity;
    data['unit'] = unit;
    data['total'] = total;
    data['dealUid'] = dealUid;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
