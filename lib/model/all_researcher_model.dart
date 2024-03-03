class AllResearcherModel {
  List<Researchers>? researchers;

  AllResearcherModel({this.researchers});

  AllResearcherModel.fromJson(Map<String, dynamic> json) {
    if (json['researchers'] != null) {
      researchers = <Researchers>[];
      json['researchers'].forEach((v) {
        researchers!.add(new Researchers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.researchers != null) {
      data['researchers'] = this.researchers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Researchers {
  String? sId;
  String? name;
  String? mobile;
  String? email;
  String? type;
  Null? image;
  String? fbToken;
  String? status;
  String? birthDate;
  String? gender;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Researchers(
      {this.sId,
      this.name,
      this.mobile,
      this.email,
      this.type,
      this.image,
      this.fbToken,
      this.status,
      this.birthDate,
      this.gender,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Researchers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    image = json['image'];
    fbToken = json['fbToken'];
    status = json['status'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['type'] = this.type;
    data['image'] = this.image;
    data['fbToken'] = this.fbToken;
    data['status'] = this.status;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
