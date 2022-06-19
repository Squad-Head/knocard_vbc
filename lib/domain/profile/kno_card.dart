// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class Knocard extends Equatable {
  const Knocard({
    required this.id,
    required this.user_id,
    required this.theme,
    required this.background_image,
    required this.about_me,
    required this.favicon,
    required this.homepage,
  });

  final int id;
  final int user_id;
  final String theme;
  final String background_image;
  final dynamic about_me;

  final dynamic favicon;
  final dynamic homepage;

  Knocard copyWith({
    int? id,
    int? user_id,
    String? theme,
    String? background_image,
    dynamic about_me,
    dynamic favicon,
    dynamic homepage,
  }) {
    return Knocard(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      theme: theme ?? this.theme,
      background_image: background_image ?? this.background_image,
      about_me: about_me ?? this.about_me,
      favicon: favicon ?? this.favicon,
      homepage: homepage ?? this.homepage,
    );
  }

  factory Knocard.fromMap(Map<String, dynamic> json) => Knocard(
        id: json["id"],
        user_id: json["user_id"],
        theme: json["theme"],
        background_image: json["background_image"],
        about_me: json["about_me"],
        favicon: json["favicon"],
        homepage: json["homepage"],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'theme': theme,
      'background_image': background_image,
      'about_me': about_me,
      'favicon': favicon,
      'homepage': homepage,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      user_id,
      theme,
      background_image,
      about_me,
      favicon,
      homepage,
    ];
  }

  @override
  String toString() {
    return 'Knocard(id: $id, user_id: $user_id, theme: $theme, background_image: $background_image, about_me: $about_me, favicon: $favicon, homepage: $homepage)';
  }

  String toJson() => json.encode(toMap());

  factory Knocard.fromJson(String source) =>
      Knocard.fromMap(json.decode(source));
  factory Knocard.init() => const Knocard(
      id: 0,
      user_id: 0,
      theme: '',
      background_image: '',
      about_me: null,
      favicon: null,
      homepage: null);
}
