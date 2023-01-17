// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'profile_video.dart';

class Playlist extends Equatable {
  final int id;
  final int user_id;
  final String name;
  final String status;
  final DateTime created_at;
  final DateTime updated_at;
  final dynamic deleted_at;
  final dynamic is_favorite;
  final String description;
  final int is_default;
  final List<ProfileVideo> videos;
  const Playlist({
    required this.id,
    required this.user_id,
    required this.name,
    required this.status,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
    required this.is_favorite,
    required this.description,
    required this.is_default,
    required this.videos,
  });

  Playlist copyWith({
    int? id,
    int? user_id,
    String? name,
    String? status,
    DateTime? created_at,
    DateTime? updated_at,
    dynamic deleted_at,
    dynamic is_favorite,
    String? description,
    int? is_default,
    List<ProfileVideo>? videos,
  }) {
    return Playlist(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      name: name ?? this.name,
      status: status ?? this.status,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
      is_favorite: is_favorite ?? this.is_favorite,
      description: description ?? this.description,
      is_default: is_default ?? this.is_default,
      videos: videos ?? this.videos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'name': name,
      'status': status,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'deleted_at': deleted_at,
      'is_favorite': is_favorite,
      'description': description,
      'is_default': is_default,
      'videos': videos.map((x) => x.toMap()).toList(),
    };
  }

  factory Playlist.fromMap(Map<String, dynamic>? map) {
    return Playlist(
      id: map?['id']?.toInt() ?? 0,
      user_id: map?['user_id']?.toInt() ?? 0,
      name: map?['name'] ?? '',
      status: map?['status'] ?? '',
      created_at: DateTime.parse(map?['created_at']),
      updated_at: DateTime.parse(map?['updated_at']),
      deleted_at: map?['deleted_at'],
      is_favorite: map?['is_favorite'],
      description: map?['description'] ?? '',
      is_default: map?['is_default']?.toInt() ?? 0,
      videos: List<ProfileVideo>.from(
          map?['videos']?.map((x) => ProfileVideo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Playlist.fromJson(String source) =>
      Playlist.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Playlist(id: $id, user_id: $user_id, name: $name, status: $status, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at, is_favorite: $is_favorite, description: $description, is_default: $is_default, videos: $videos)';
  }

  @override
  List<Object> get props {
    return [
      id,
      user_id,
      name,
      status,
      created_at,
      updated_at,
      deleted_at,
      is_favorite,
      description,
      is_default,
      videos,
    ];
  }

  factory Playlist.init() => Playlist(
      id: 0,
      user_id: 0,
      name: '',
      status: '',
      created_at: DateTime.now(),
      updated_at: DateTime.now(),
      deleted_at: null,
      is_favorite: null,
      description: '',
      is_default: 0,
      videos: const []);
}
