class UserModel {
  String? name;
  String? email;
  String? mobile;
  String? gender;
  String? type;
  String? token;
  String? password;
  String? birthDate;
  String? message;

  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.mobile,
    required this.token,
    required this.type,
    required this.gender,
    required this.birthDate,
    required this.message,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'] ?? '';
    name = json['name'] ?? '';
    mobile = json['mobile'] ?? '';
    gender = json['gender'] ?? '';
    type = json['type'] ?? '';
    password = json['password'] ?? '';
    birthDate = json['birthDate'] ?? '';
    message = json['message'] ?? '';
    token = json['token'] ?? '';
  }
}
