import 'package:equatable/equatable.dart';

class User extends Equatable {
  final UserData user;
  final String token;

  const User({
    required this.user,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      user: UserData.fromJson(json['user']),
    );
  }

  @override
  List<Object> get props => [user, token];
}

class UserData extends Equatable {
  final int id;
  final String name;
  final String email;
  final DateTime emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: DateTime.parse(json['email_verified_at']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        email,
        emailVerifiedAt,
        createdAt,
        updatedAt,
      ];
}
