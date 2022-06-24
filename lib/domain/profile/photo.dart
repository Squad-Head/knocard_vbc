import 'dart:convert';

import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final String link;
  final String type;
  final String title;
  const Photo({
    required this.link,
    required this.type,
    required this.title,
  });

  Photo copyWith({
    String? link,
    String? type,
    String? title,
  }) {
    return Photo(
      link: link ?? this.link,
      type: type ?? this.type,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'type': type,
      'title': title,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      link: map['link'] ?? '',
      type: map['type'] ?? '',
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) => Photo.fromMap(json.decode(source));

  @override
  String toString() => 'Photo(link: $link, type: $type, title: $title)';

  @override
  List<Object> get props => [link, type, title];
}
