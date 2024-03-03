class ResearchesOfResearcherModle {
  List<ResearchesOfResearchers>? researches;

  ResearchesOfResearcherModle({this.researches});

  ResearchesOfResearcherModle.fromJson(Map<String, dynamic> json) {
    if (json['researches'] != null) {
      researches = <ResearchesOfResearchers>[];
      json['researches'].forEach((v) {
        researches!.add(new ResearchesOfResearchers.fromJson(v));
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

class ResearchesOfResearchers {
  String? sId;
  Researherr? researher;
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
  String? description;
  List<StudentsStatus>? studentsStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? newRequest;

  ResearchesOfResearchers(
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
      this.description,
      this.studentsStatus,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.newRequest});

  ResearchesOfResearchers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    researher = json['researher'] != null
        ? new Researherr.fromJson(json['researher'])
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
    description = json['description'];
    if (json['studentsStatus'] != null) {
      studentsStatus = <StudentsStatus>[];
      json['studentsStatus'].forEach((v) {
        studentsStatus!.add(new StudentsStatus.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    newRequest = json['newRequest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.researher != null) {
      data['researher'] = this.researher!.toJson();
    }
    data['researchQuestion'] = this.researchQuestion;
    data['hand'] = this.hand;
    data['language'] = this.language;
    data['vision'] = this.vision;
    data['hearingNormal'] = this.hearingNormal;
    data['origin'] = this.origin;
    data['ADHD'] = this.aDHD;
    data['musicalBackground'] = this.musicalBackground;
    data['Credits'] = this.credits;
    data['status'] = this.status;
    data['description'] = this.description;
    if (this.studentsStatus != null) {
      data['studentsStatus'] =
          this.studentsStatus!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['newRequest'] = this.newRequest;
    return data;
  }
}

class Researherr {
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

  Researherr(
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

  Researherr.fromJson(Map<String, dynamic> json) {
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

class StudentsStatus {
  String? status;
  Student? student;
  String? updateTime;
  String? sId;

  StudentsStatus({this.status, this.student, this.updateTime, this.sId});

  StudentsStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
    updateTime = json['updateTime'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    data['updateTime'] = this.updateTime;
    data['_id'] = this.sId;
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
