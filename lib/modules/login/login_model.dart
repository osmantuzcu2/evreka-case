class LoginModel {
  LoginModel({
    this.id,
    this.userName,
    this.password,
  });
  factory LoginModel.fromJson(Map<String, String> json) => LoginModel(
        id: json["Id"],
        userName: json["UserName"],
        password: json["Password"],
      );

  String id;
  String userName;
  String password;

  Map<String, dynamic> toJson() => {
        'Id': id,
        'UserName': userName,
        'Password': password,
      };
}
