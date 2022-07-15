import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'photo.dart';

class Collage extends Equatable {
  final String title;
  final int id;
  final List<Photo> photoGallery;
  Collage({
    required this.title,
    required this.photoGallery,
    required this.id,
  });

  Collage copyWith({
    String? title,
    int? id,
    List<Photo>? photoGallery,
  }) {
    return Collage(
      title: title ?? this.title,
      id: id ?? this.id,
      photoGallery: photoGallery ?? this.photoGallery,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'photo_gallery': photoGallery.map((x) => x.toMap()).toList(),
    };
  }

  factory Collage.fromMap(Map<String, dynamic> map) {
    return Collage(
      title: map['title'] ?? '',
      id: map['id']?.toInt() ?? 0,
      photoGallery: List<Photo>.from(
          map['photo_gallery']?.map((x) => Photo.fromMap(x)) ?? const []),
    );
  }

  @override
  String toString() =>
      'Collage(title: $title, id: $id, photoGallery: $photoGallery)';

  @override
  List<Object> get props => [title, id, photoGallery];
}
