class StudentResearchesModel {
  String? sId;
  String? researher;
  String? description;
  String? researchQuestion;
  int? newRequest;
  List<String>? hand;
  List<String>? language;
  List<String>? vision;
  List<String>? hearingNormal;
  List<String>? origin;
  List<String>? aDHD;
  List<String>? musicalBackground;
  int? credits;
  String? status;
  List<Map<String, dynamic>>? studentsStatus;
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
      this.studentsStatus,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.newRequest,
      this.description,
      this.matchingCriteriaCount});

  StudentResearchesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    researher = json['researher'];
    description = json['description'];
    newRequest = json['newRequest'];
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
      studentsStatus = <Map<String, dynamic>>[];
      json['studentsStatus'].forEach((v) {
        studentsStatus!.add(v);
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    matchingCriteriaCount = json['matchingCriteriaCount'];
  }
}
