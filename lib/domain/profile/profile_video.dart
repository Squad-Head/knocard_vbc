// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProfileVideo extends Equatable {
  final int id;
  final int user_id;
  final String platform;
  final String link;
  final String status;
  final DateTime created_at;
  final DateTime updated_at;
  final dynamic deleted_at;
  final String description;
  final int playlist_id;
  final String title;
  final String thumbnail;
  final dynamic sort_order;
  const ProfileVideo({
    required this.id,
    required this.user_id,
    required this.platform,
    required this.link,
    required this.status,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
    required this.description,
    required this.playlist_id,
    required this.title,
    required this.thumbnail,
    required this.sort_order,
  });

  ProfileVideo copyWith({
    int? id,
    int? user_id,
    String? platform,
    String? link,
    String? status,
    DateTime? created_at,
    DateTime? updated_at,
    dynamic deleted_at,
    String? description,
    int? playlist_id,
    String? title,
    String? thumbnail,
    dynamic sort_order,
  }) {
    return ProfileVideo(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      platform: platform ?? this.platform,
      link: link ?? this.link,
      status: status ?? this.status,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
      description: description ?? this.description,
      playlist_id: playlist_id ?? this.playlist_id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      sort_order: sort_order ?? this.sort_order,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'platform': platform,
      'link': link,
      'status': status,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'deleted_at': deleted_at,
      'description': description,
      'playlist_id': playlist_id,
      'title': title,
      'thumbnail': thumbnail,
      'sort_order': sort_order,
    };
  }

  factory ProfileVideo.fromMap(Map<String, dynamic> map) {
    return ProfileVideo(
      id: map['id']?.toInt() ?? 0,
      user_id: map['user_id']?.toInt() ?? 0,
      platform: map['platform'] ?? '',
      link: map['link'] ?? '',
      status: map['status'] ?? '',
      created_at: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updated_at: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
      deleted_at: map['deleted_at'],
      description: map['description'] ?? '',
      playlist_id: map['playlist_id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      sort_order: map['sort_order'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileVideo.fromJson(String source) =>
      ProfileVideo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileVideo(id: $id, user_id: $user_id, platform: $platform, link: $link, status: $status, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at, description: $description, playlist_id: $playlist_id, title: $title, thumbnail: $thumbnail, sort_order: $sort_order)';
  }

  @override
  List<Object> get props {
    return [
      id,
      user_id,
      platform,
      link,
      status,
      created_at,
      updated_at,
      deleted_at,
      description,
      playlist_id,
      title,
      thumbnail,
      sort_order,
    ];
  }

  factory ProfileVideo.init() => ProfileVideo(
      id: 0,
      user_id: 0,
      platform: '',
      link: '',
      status: '',
      created_at: DateTime.now(),
      updated_at: DateTime.now(),
      deleted_at: null,
      description: '',
      playlist_id: 0,
      title: '',
      thumbnail: '',
      sort_order: null);
}
