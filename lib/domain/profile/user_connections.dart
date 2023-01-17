import 'package:equatable/equatable.dart';
import 'package:knocard_ui/domain/profile/refferedUser.dart';

class UserConnections extends Equatable {
  final int id;
  final int userId;
  final int refferedId;
  final String createdAt;
  final String updatedAt;
  final RefferedUser refferedUser;

  const UserConnections({
    required this.id,
    required this.userId,
    required this.refferedId,
    required this.createdAt,
    required this.updatedAt,
    required this.refferedUser,
  });

  UserConnections copyWith({
    int? id,
    int? userId,
    int? refferedId,
    String? createdAt,
    String? updatedAt,
    RefferedUser? refferedUser
  }) {
    return UserConnections(
      id: id ?? this.id,
      userId:  userId??this.userId,
      refferedId:  refferedId??this.refferedId,
      createdAt:  createdAt??this.createdAt,
      updatedAt:  updatedAt??this.updatedAt,
        refferedUser: refferedUser ?? this.refferedUser
    );
  }

  Map<String, dynamic> toMap() {
    return {
    'id':id,
    'user_id':userId,
    'reffered_id':refferedId,
    'created_at':createdAt,
    'updated_at':updatedAt,
     'reffered_user':refferedUser
    };
  }

  factory UserConnections.fromMap(Map<String, dynamic>? map) {

      return UserConnections(
          id: map?['id']?.toInt() ?? 0,
          userId: map?['user_id']?.toInt() ?? 0,
          refferedId: map?['reffered_id']?.toInt() ?? 0,
          createdAt: map?['created_at'] ?? "",
          updatedAt: map?['updated_at'] ?? "",
          refferedUser: RefferedUser.fromMap(map?['reffered_user'])
      );


  }

  @override
  String toString() => 'UserConnections(id: $id,userId: $userId,refferedId: $refferedId ,createdAt: $createdAt,updatedAt:$updatedAt, refferedUser: $refferedUser)';

  @override
  List<Object> get props => [id,userId,refferedId,createdAt,updatedAt,refferedUser];
}