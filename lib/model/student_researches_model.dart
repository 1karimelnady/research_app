// class StudentResearchesModel {
//   String? sId;
//   String? researher;
//   String? description;
//   String? researchQuestion;
//   int? newRequest;
//   List<String>? hand;
//   List<String>? language;
//   List<String>? vision;
//   List<String>? hearingNormal;
//   List<String>? origin;
//   List<String>? aDHD;
//   List<String>? musicalBackground;
//   int? credits;
//   String? status;
//   List<Map<String, dynamic>>? studentsStatus;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//   int? matchingCriteriaCount;
//
//   StudentResearchesModel(
//       {this.sId,
//       this.researher,
//       this.researchQuestion,
//       this.hand,
//       this.language,
//       this.vision,
//       this.hearingNormal,
//       this.origin,
//       this.aDHD,
//       this.musicalBackground,
//       this.credits,
//       this.status,
//       this.studentsStatus,
//       this.createdAt,
//       this.updatedAt,
//       this.iV,
//       this.newRequest,
//       this.description,
//       this.matchingCriteriaCount});
//
//   StudentResearchesModel.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     researher = json['researher'];
//     description = json['description'];
//     newRequest = json['newRequest'];
//     researchQuestion = json['researchQuestion'];
//     hand = json['hand'].cast<String>();
//     language = json['language'].cast<String>();
//     vision = json['vision'].cast<String>();
//     hearingNormal = json['hearingNormal'].cast<String>();
//     origin = json['origin'].cast<String>();
//     aDHD = json['ADHD'].cast<String>();
//     musicalBackground = json['musicalBackground'].cast<String>();
//     credits = json['Credits'];
//     status = json['status'];
//
//     if (json['studentsStatus'] != null) {
//       studentsStatus = <Map<String, dynamic>>[];
//       json['studentsStatus'].forEach((v) {
//         studentsStatus!.add(v);
//       });
//     }
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//     matchingCriteriaCount = json['matchingCriteriaCount'];
//   }
// }
//
// class StudentsStatus {
//   String? status;
//   Student? student;
//   String? updateTime;
//   String? sId;
//
//   StudentsStatus({this.status, this.student, this.updateTime, this.sId});
//
//   StudentsStatus.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     student =
//         json['student'] != null ? new Student.fromJson(json['student']) : null;
//     updateTime = json['updateTime'];
//     sId = json['_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.student != null) {
//       data['student'] = this.student!.toJson();
//     }
//     data['updateTime'] = this.updateTime;
//     data['_id'] = this.sId;
//     return data;
//   }
// }
//
// class Student {
//   String? sId;
//   String? name;
//   String? mobile;
//   String? email;
//   String? type;
//   Null? image;
//   String? fbToken;
//   String? status;
//   String? birthDate;
//   String? gender;
//   String? hand;
//   String? language;
//   String? version;
//   String? hearingNormal;
//   String? origin;
//   String? aDHD;
//   String? musicalBackground;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//
//   Student(
//       {this.sId,
//       this.name,
//       this.mobile,
//       this.email,
//       this.type,
//       this.image,
//       this.fbToken,
//       this.status,
//       this.birthDate,
//       this.gender,
//       this.hand,
//       this.language,
//       this.version,
//       this.hearingNormal,
//       this.origin,
//       this.aDHD,
//       this.musicalBackground,
//       this.createdAt,
//       this.updatedAt,
//       this.iV});
//
//   Student.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     mobile = json['mobile'];
//     email = json['email'];
//     type = json['type'];
//     image = json['image'];
//     fbToken = json['fbToken'];
//     status = json['status'];
//     birthDate = json['birthDate'];
//     gender = json['gender'];
//     hand = json['hand'];
//     language = json['language'];
//     version = json['version'];
//     hearingNormal = json['hearingNormal'];
//     origin = json['origin'];
//     aDHD = json['ADHD'];
//     musicalBackground = json['musicalBackground'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['mobile'] = this.mobile;
//     data['email'] = this.email;
//     data['type'] = this.type;
//     data['image'] = this.image;
//     data['fbToken'] = this.fbToken;
//     data['status'] = this.status;
//     data['birthDate'] = this.birthDate;
//     data['gender'] = this.gender;
//     data['hand'] = this.hand;
//     data['language'] = this.language;
//     data['version'] = this.version;
//     data['hearingNormal'] = this.hearingNormal;
//     data['origin'] = this.origin;
//     data['ADHD'] = this.aDHD;
//     data['musicalBackground'] = this.musicalBackground;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
class StudentResearchesModel {
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
  List<StudentsStatusss>? studentsStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? matchingCriteriaCount;

  StudentResearchesModel(
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
      this.iV,
      this.matchingCriteriaCount});

  StudentResearchesModel.fromJson(Map<String, dynamic> json) {
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
      studentsStatus = <StudentsStatusss>[];
      json['studentsStatus'].forEach((v) {
        studentsStatus!.add(new StudentsStatusss.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    matchingCriteriaCount = json['matchingCriteriaCount'];
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
    data['matchingCriteriaCount'] = this.matchingCriteriaCount;
    return data;
  }
}

class StudentsStatusss {
  String? status;
  String? student;
  String? updateTime;
  String? sId;

  StudentsStatusss({this.status, this.student, this.updateTime, this.sId});

  StudentsStatusss.fromJson(Map<String, dynamic> json) {
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
