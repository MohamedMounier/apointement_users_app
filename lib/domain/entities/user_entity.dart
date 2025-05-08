import 'package:appointment_users/core/utils/enums/app_enums.dart';

class UserEntity {
  final String uid;
  final String name;
  final String email;
  final UserTypes userType;
  final DateTime createdAt;

  const UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.userType,
    required this.createdAt,
  });

  factory UserEntity.anonymous() => UserEntity(
    uid: '0',
    userType: UserTypes.user,
    name: 'Anonymous',
    email: '',
    createdAt: DateTime.now(),
  );
}
