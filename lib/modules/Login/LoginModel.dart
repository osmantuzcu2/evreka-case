class LoginModel {
  LoginModel({
    this.id,
    this.userName,
    this.password,
    this.userType,
    this.name,
    this.lastName,
    this.eMail,
    this.phone,
    this.status,
    this.token,
  });

  String id;
  String userName;
  String password;
  String userType;
  String name;
  String lastName;
  String eMail;
  String phone;
  String status;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["Id"],
        userName: json["UserName"],
        password: json["Password"],
        userType: json["UserType"],
        name: json["Name"],
        lastName: json["LastName"],
        eMail: json["EMail"],
        phone: json["Phone"],
        status: json["Status"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserName": userName,
        "Password": password,
        "UserType": userType,
        "Name": name,
        "LastName": lastName,
        "EMail": eMail,
        "Phone": phone,
        "Status": status,
        "Token": token,
      };
}
