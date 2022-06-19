// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class SocialMedia extends Equatable {
  final int id;
  final int user_id;
  final String name;
  final dynamic user_handle;
  final String link;
  final DateTime created_at;
  final DateTime updated_at;
  const SocialMedia({
    required this.id,
    required this.user_id,
    required this.name,
    required this.user_handle,
    required this.link,
    required this.created_at,
    required this.updated_at,
  });

  SocialMedia copyWith({
    int? id,
    int? user_id,
    String? name,
    dynamic user_handle,
    String? link,
    DateTime? created_at,
    DateTime? updated_at,
  }) {
    return SocialMedia(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      name: name ?? this.name,
      user_handle: user_handle ?? this.user_handle,
      link: link ?? this.link,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  // factory SocialMedia.fromMap(Map<String, dynamic> json) => SocialMedia(
  //       id: json["id"],
  //       userId: json["user_id"],
  //       name: json["name"],
  //       userHandle: json["user_handle"],
  //       link: json["link"],
  //       createdAt: DateTime.parse(json["created_at"]),
  //       updatedAt: DateTime.parse(json["updated_at"]),
  //     );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'name': name,
      'user_handle': user_handle,
      'link': link,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      user_id,
      name,
      user_handle,
      link,
      created_at,
      updated_at,
    ];
  }

  @override
  String toString() {
    return 'SocialMedia(id: $id, user_id: $user_id, name: $name, user_handle: $user_handle, link: $link, created_at: $created_at, updated_at: $updated_at)';
  }

  String toJson() => json.encode(toMap());

  factory SocialMedia.fromJson(String source) =>
      SocialMedia.fromMap(json.decode(source));

  factory SocialMedia.fromMap(Map<String, dynamic> map) {
    return SocialMedia(
      id: map['id']?.toInt() ?? 0,
      user_id: map['user_id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      user_handle: map['user_handle'],
      link: map['link'] ?? '',
      created_at: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updated_at: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }
}
