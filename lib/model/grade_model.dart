class GradeModel {
  List<AllGrades>? allGrades;

  GradeModel({this.allGrades});

  GradeModel.fromJson(Map<String, dynamic> json) {
    if (json['allGrades'] != null) {
      allGrades = <AllGrades>[];
      json['allGrades'].forEach((v) {
        allGrades!.add(new AllGrades.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allGrades != null) {
      data['allGrades'] = this.allGrades!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllGrades {
  String? sId;
  String? student;
  Research? research;
  Researcher? researcher;
  bool? isSuccess;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AllGrades(
      {this.sId,
      this.student,
      this.research,
      this.researcher,
      this.isSuccess,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AllGrades.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    student = json['student'];
    research = json['research'] != null
        ? new Research.fromJson(json['research'])
        : null;
    researcher = json['researcher'] != null
        ? new Researcher.fromJson(json['researcher'])
        : null;
    isSuccess = json['isSuccess'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['student'] = this.student;
    if (this.research != null) {
      data['research'] = this.research!.toJson();
    }
    if (this.researcher != null) {
      data['researcher'] = this.researcher!.toJson();
    }
    data['isSuccess'] = this.isSuccess;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Research {
  String? sId;
  String? researher;
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
  String? approvment;
  String? description;
  int? newRequest;
  List<StudentsStatus>? studentsStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Research(
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
      this.approvment,
      this.description,
      this.newRequest,
      this.studentsStatus,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Research.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    researher = json['researher'];
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
    approvment = json['approvment'];
    description = json['description'];
    newRequest = json['newRequest'];
    if (json['studentsStatus'] != null) {
      studentsStatus = <StudentsStatus>[];
      json['studentsStatus'].forEach((v) {
        studentsStatus!.add(new StudentsStatus.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['researher'] = this.researher;
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
    data['approvment'] = this.approvment;
    data['description'] = this.description;
    data['newRequest'] = this.newRequest;
    if (this.studentsStatus != null) {
      data['studentsStatus'] =
          this.studentsStatus!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class StudentsStatus {
  String? status;
  String? student;
  String? updateTime;
  String? sId;

  StudentsStatus({this.status, this.student, this.updateTime, this.sId});

  StudentsStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    student = json['student'];
    updateTime = json['updateTime'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['student'] = this.student;
    data['updateTime'] = this.updateTime;
    data['_id'] = this.sId;
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
  String? fbToken;
  String? status;
  String? birthDate;
  String? gender;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Researcher(
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

  Researcher.fromJson(Map<String, dynamic> json) {
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
