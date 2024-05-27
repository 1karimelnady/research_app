class UpdateUserModel {
  String? sId;
  String? name;
  String? mobile;
  String? email;
  String? type;
  String? image;
  String? fbToken;
  String? status;
  String? birthDate;
  String? gender;
  String? password;
  String? hand;
  String? language;
  String? version;
  String? hearingNormal;
  String? origin;
  String? aDHD;
  String? musicalBackground;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UpdateUserModel(
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
        this.hand,
        this.language,
        this.version,
        this.hearingNormal,
        this.origin,
        this.aDHD,
        this.musicalBackground,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UpdateUserModel.fromJson(Map<String, dynamic> json) {
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
    hand = json['hand'];
    language = json['language'];
    version = json['version'];
    hearingNormal = json['hearingNormal'];
    origin = json['origin'];
    aDHD = json['ADHD'];
    musicalBackground = json['musicalBackground'];
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
    data['hand'] = this.hand;
    data['language'] = this.language;
    data['version'] = this.version;
    data['hearingNormal'] = this.hearingNormal;
    data['origin'] = this.origin;
    data['ADHD'] = this.aDHD;
    data['musicalBackground'] = this.musicalBackground;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}