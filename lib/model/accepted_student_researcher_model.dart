class AcceptedStudentModel {
  List<ResearchesAccepted>? researches;

  AcceptedStudentModel({this.researches});

  AcceptedStudentModel.fromJson(Map<String, dynamic> json) {
    if (json['researches'] != null) {
      researches = <ResearchesAccepted>[];
      json['researches'].forEach((v) {
        researches!.add(new ResearchesAccepted.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.researches != null) {
      data['researches'] = this.researches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResearchesAccepted {
  String? researchId;
  Researcher? researcher;
  Student? student;

  ResearchesAccepted({this.researchId, this.researcher, this.student});

  ResearchesAccepted.fromJson(Map<String, dynamic> json) {
    researchId = json['researchId'];
    researcher = json['researcher'] != null
        ? new Researcher.fromJson(json['researcher'])
        : null;
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['researchId'] = this.researchId;
    if (this.researcher != null) {
      data['researcher'] = this.researcher!.toJson();
    }
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    return data;
  }
}

class Researcher {
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
  String? fbToken;

  Researcher(
      {this.sId,
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
      this.iV,
      this.fbToken});

  Researcher.fromJson(Map<String, dynamic> json) {
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
    fbToken = json['fbToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['fbToken'] = this.fbToken;
    return data;
  }
}

class Student {
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

  Student(
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

  Student.fromJson(Map<String, dynamic> json) {
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
