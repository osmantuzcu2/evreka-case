class LoginModel {
  LoginModel({
    this.id,
    this.userName,
    this.password,
  });

  String id;
  String userName;
  String password;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["Id"],
        userName: json["UserName"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserName": userName,
        "Password": password,
      };
}
