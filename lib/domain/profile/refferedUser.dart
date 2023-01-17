import 'package:equatable/equatable.dart';
import 'package:knocard_ui/domain/profile/user_profile.dart';

class RefferedUser extends Equatable {
  final int id;
  final String name;
  final String username;
  final String first_name;
  final String last_name;
  final String profile_picture;

  const RefferedUser({
    required this.id,
    required this.name,
    required this.username,
    required this.first_name,
    required this.last_name,
    required this.profile_picture,
  });

  RefferedUser copyWith({
    int? id,
    String? name,
    String? username,
    String? first_name,
    String? last_name,
    String? profile_picture
  }) {
    return RefferedUser(
      id: id ?? this.id,
      name:  name??this.name,
      username:  username??this.username,
      first_name:  first_name??this.first_name,
      last_name:  last_name??this.last_name,
      profile_picture:  profile_picture??this.profile_picture,

    );
  }

  Map<String, dynamic> toMap() {
    return {
    'id':id,
    'name':name,
    'username':username,
    'first_name':first_name,
    'last_name':last_name,
     'profile_picture':profile_picture
    };
  }

  factory RefferedUser.fromMap(Map<String, dynamic>? map) {

      return RefferedUser(
          id: map?['id']?.toInt() ?? 0,
          name: map?['name'] ??"",
           username: map?['username']??"",
          first_name: map?['first_name'] ?? "",
          last_name: map?['last_name'] ?? "",
          profile_picture: map?['profile_picture'] ?? "",
      );


  }

  @override
  String toString() => 'RefferedUser(id: $id,name: $name,username: $username ,first_name: $first_name,last_name:$last_name, profile_picture: $profile_picture)';

  @override
  List<Object> get props => [id,name, username, first_name, last_name, profile_picture];
}