class ResearchesModel {
  List<Researches>? researches;

  ResearchesModel({this.researches});

  ResearchesModel.fromJson(Map<String, dynamic> json) {
    if (json['researches'] != null) {
      researches = <Researches>[];
      json['researches'].forEach((v) {
        researches!.add(new Researches.fromJson(v));
      });
    }
  }
}

class Researches {
  String? sId;
  Researher? researher;
  String? researchQuestion;
  List<String>? hand;
  List<String>? language;
  List<String>? vision;
  List<String>? hearingNormal;
  List<String>? origin;
  List<String>? aDHD;
  List<String>? musicalBackground;
  int? credits;
  String? status;
  List<int>? studentsStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Researches(
      {this.sId,
      this.researher,
      this.researchQuestion,
      this.hand,
      this.language,
      this.vision,
      this.hearingNormal,
      this.origin,
      this.aDHD,
      this.musicalBackground,
      this.credits,
      this.status,
      this.studentsStatus,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Researches.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    researher = json['researher'] != null
        ? new Researher.fromJson(json['researher'])
        : null;
    researchQuestion = json['researchQuestion'];
    hand = json['hand'].cast<String>();
    language = json['language'].cast<String>();
    vision = json['vision'].cast<String>();
    hearingNormal = json['hearingNormal'].cast<String>();
    origin = json['origin'].cast<String>();
    aDHD = json['ADHD'].cast<String>();
    musicalBackground = json['musicalBackground'].cast<String>();
    credits = json['Credits'];
    status = json['status'];
    if (json['studentsStatus'] != null) {
      studentsStatus = <int>[];
      json['studentsStatus'].forEach((v) {
        studentsStatus!.add(v!);
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class Researher {
  Null? fbToken;
  String? sId;
  String? name;
  String? mobile;
  String? email;
  String? type;
  Null? image;
  String? status;
  String? birthDate;
  String? gender;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Researher(
      {this.fbToken,
      this.sId,
      this.name,
      this.mobile,
      this.email,
      this.type,
      this.image,
      this.status,
      this.birthDate,
      this.gender,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Researher.fromJson(Map<String, dynamic> json) {
    fbToken = json['fbToken'];
    sId = json['_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    image = json['image'];
    status = json['status'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fbToken'] = this.fbToken;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['type'] = this.type;
    data['image'] = this.image;
    data['status'] = this.status;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
