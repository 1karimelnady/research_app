class NotificationModel {
  String? sId;
  User? user;
  Research? research;
  String? title;
  String? body;
  Null? image;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? iV;

  NotificationModel(
      {this.sId,
      this.user,
      this.research,
      this.title,
      this.body,
      this.image,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.iV});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    research = json['research'] != null
        ? new Research.fromJson(json['research'])
        : null;
    title = json['title'];
    body = json['body'];
    image = json['image'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.research != null) {
      data['research'] = this.research!.toJson();
    }
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? mobile;
  String? email;
  String? type;
  Null? image;
  String? status;
  String? birthDate;
  String? gender;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? fbToken;

  User(
      {this.sId,
      this.name,
      this.mobile,
      this.email,
      this.type,
      this.image,
      this.status,
      this.birthDate,
      this.gender,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.fbToken});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    image = json['image'];
    status = json['status'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    password = json['password'];
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
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['fbToken'] = this.fbToken;
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
  List<StudentsStatus>? studentsStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? description;
  int? newRequest;

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
      this.studentsStatus,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.description,
      this.newRequest});

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
    if (json['studentsStatus'] != null) {
      studentsStatus = <StudentsStatus>[];
      json['studentsStatus'].forEach((v) {
        studentsStatus!.add(new StudentsStatus.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    description = json['description'];
    newRequest = json['newRequest'];
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
    if (this.studentsStatus != null) {
      data['studentsStatus'] =
          this.studentsStatus!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['description'] = this.description;
    data['newRequest'] = this.newRequest;
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
