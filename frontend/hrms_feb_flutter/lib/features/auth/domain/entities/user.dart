class User {
  final int userId;
  final String userfullname;
  final String emailaddress;
  final String token;
  final String refreshtoken;
  final int emprole;

  User({
    required this.userId,
    required this.userfullname,
    required this.emailaddress,
    required this.token,
    required this.refreshtoken,
    required this.emprole,
  });

  factory User.fromLoginJson(Map<String, dynamic> json, String token, String refreshtoken) {
    return User(
      userId: json['id'],
      userfullname: json['userfullname'],
      emailaddress: json['emailaddress'],
      emprole: json['emprole'],
      token: token,
      refreshtoken: refreshtoken,
    );
  }

  User copyWith({
    int? userId,
    String? userfullname,
    String? emailaddress,
    String? token,
    String? refreshtoken,
    int? emprole,
  }) {
    return User(
      userId: userId ?? this.userId,
      userfullname: userfullname ?? this.userfullname,
      emailaddress: emailaddress ?? this.emailaddress,
      token: token ?? this.token,
      refreshtoken: refreshtoken ?? this.refreshtoken,
      emprole: emprole ?? this.emprole,
    );
  }
}
