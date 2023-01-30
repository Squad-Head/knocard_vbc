import 'dart:convert';

import 'package:equatable/equatable.dart';

class ContentData extends Equatable {
  final int id;
  final String link;
  final String type;
  final String thumbnail;
  ContentData({
    required this.id,
    required this.link,
    required this.type,
    required this.thumbnail,
  });

  ContentData copyWith({
    int? id,
    String? link,
    String? type,
    String? thumbnail,
  }) {
    return ContentData(
      id: id ?? this.id,
      link: link ?? this.link,
      type: type ?? this.type,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'link': link,
      'type': type,
      'thumbnail': thumbnail,
    };
  }

  factory ContentData.fromMap(Map<String, dynamic> map) {
    return ContentData(
      id: map['id']?.toInt() ?? 0,
      link: map['link'] ?? '',
      type: map['type'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  bool get isImage => type == 'image';

  factory ContentData.fromJson(String source) =>
      ContentData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContentData(id: $id, link: $link, type: $type, thumbnail: $thumbnail)';
  }

  @override
  List<Object> get props => [id, link, type, thumbnail];
}
