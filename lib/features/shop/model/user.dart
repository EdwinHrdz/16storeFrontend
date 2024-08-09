class User {
  final int userId;
  final String name;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNo;
  final int userType;
  final String token;
  final int isSuccess;
  final String message;

  User({
    required this.userId,
    required this.name,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNo,
    required this.userType,
    required this.token,
    required this.isSuccess,
    required this.message,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      name: json['name'],
      lastName: json['lastName'],
      userName: json['userName'],
      email: json['email'],
      phoneNo: json['phoneNo'],
      userType: json['userType'],
      token: json['token'],
      isSuccess: json['isSuccess'],
      message: json['message'],
    );
  }
}
