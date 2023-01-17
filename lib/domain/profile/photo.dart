import 'dart:convert';

import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final String link;
  final int id;
  final String type;
  final String title;
  final String description;
  const Photo({
    required this.link,
    required this.id,
    required this.type,
    required this.title,
    required this.description,
  });

  Photo copyWith({
    String? link,
    int? id,
    String? type,
    String? title,
    String? description,
  }) {
    return Photo(
      link: link ?? this.link,
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'id': id,
      'type': type,
      'title': title,
      'description': description,
    };
  }

  factory Photo.fromMap(Map<String, dynamic>? map) {
    return Photo(
      link: map?['link'] ?? '',
      id: map?['id']?.toInt() ?? 0,
      type: map?['type'] ?? '',
      title: map?['title'] ?? '',
      description: map?['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) => Photo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Photo(link: $link, id: $id, type: $type, title: $title, description: $description)';
  }

  @override
  List<Object> get props {
    return [
      link,
      id,
      type,
      title,
      description,
    ];
  }
}
