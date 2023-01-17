// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExternalPageData extends Equatable {
  final int id;
  final int user_id;
  final String name;
  final String link;
  final String icon;
  final int is_selected;
  final DateTime created_at;
  final DateTime updated_at;
  const ExternalPageData({
    required this.id,
    required this.user_id,
    required this.name,
    required this.link,
    required this.icon,
    required this.is_selected,
    required this.created_at,
    required this.updated_at,
  });

  ExternalPageData copyWith({
    int? id,
    int? user_id,
    String? name,
    String? link,
    String? icon,
    int? is_selected,
    DateTime? created_at,
    DateTime? updated_at,
  }) {
    return ExternalPageData(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      name: name ?? this.name,
      link: link ?? this.link,
      icon: icon ?? this.icon,
      is_selected: is_selected ?? this.is_selected,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  // Icon iconWidget({Color color = const Color(0xff088AC7)}) {
  //   final int index = int.tryParse(icon) ?? 0;
  //   final extICon = Constants.externalIcons[index];

  //   return Icon(
  //     extICon.icon,
  //     size: extICon.size,
  //     color: color,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'name': name,
      'link': link,
      'icon': icon,
      'is_selected': is_selected,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
    };
  }

  factory ExternalPageData.fromMap(Map<String, dynamic>? map) {
    return ExternalPageData(
      id: map?['id']?.toInt() ?? 0,
      user_id: map?['user_id']?.toInt() ?? 0,
      name: map?['name'] ?? '',
      link: map?['link'] ?? '',
      icon: map?['icon'] ?? '',
      is_selected: map?['is_selected']?.toInt() ?? 0,
      created_at: DateTime.parse(map?['created_at']),
      updated_at: DateTime.parse(map?['updated_at']),
    );
  }

  @override
  String toString() {
    return 'ExternalPageData(id: $id, user_id: $user_id, name: $name, link: $link, icon: $icon, is_selected: $is_selected, created_at: $created_at, updated_at: $updated_at,)';
  }

  @override
  List<Object> get props {
    return [
      id,
      user_id,
      name,
      link,
      icon,
      is_selected,
      created_at,
      updated_at,
    ];
  }

  String toJson() => json.encode(toMap());

  factory ExternalPageData.fromJson(String source) =>
      ExternalPageData.fromMap(json.decode(source));

  factory ExternalPageData.init() => ExternalPageData(
        id: 0,
        user_id: 0,
        name: '',
        link: '',
        icon: '',
        is_selected: 0,
        created_at: DateTime.now(),
        updated_at: DateTime.now(),
      );
}
