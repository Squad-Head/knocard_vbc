import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'content_data.dart';

class PostData extends Equatable {
  final int id;
  final String description;
  final List<ContentData> contents;
  PostData({
    required this.id,
    required this.description,
    required this.contents,
  });

  PostData copyWith({
    int? id,
    String? description,
    List<ContentData>? contents,
  }) {
    return PostData(
      id: id ?? this.id,
      description: description ?? this.description,
      contents: contents ?? this.contents,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'contents': contents.map((x) => x.toMap()).toList(),
    };
  }

  factory PostData.fromMap(Map<String, dynamic> map) {
    return PostData(
      id: map['id']?.toInt() ?? 0,
      description: map['description'] ?? '',
      contents: List<ContentData>.from(
          map['contents']?.map((x) => ContentData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostData.fromJson(String source) =>
      PostData.fromMap(json.decode(source));

  @override
  String toString() =>
      'PostData(id: $id, description: $description, contents: $contents)';

  @override
  List<Object> get props => [id, description, contents];
}
