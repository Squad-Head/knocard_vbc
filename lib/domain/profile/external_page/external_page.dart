// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'external_page_file.dart';

class ExternalPageData extends Equatable {
  final int id;
  final int user_id;
  final String name;
  final String link;
  final String icon;
  final int is_selected;
  final DateTime created_at;
  final DateTime updated_at;
  final List<ExternalPageFile> external_page_files;
  const ExternalPageData({
    required this.id,
    required this.user_id,
    required this.name,
    required this.link,
    required this.icon,
    required this.is_selected,
    required this.created_at,
    required this.updated_at,
    required this.external_page_files,
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
    List<ExternalPageFile>? external_page_files,
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
      external_page_files: external_page_files ?? this.external_page_files,
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
      'external_page_files': external_page_files.map((x) => x.toMap()).toList(),
    };
  }

  factory ExternalPageData.fromMap(Map<String, dynamic> map) {
    return ExternalPageData(
      id: map['id']?.toInt() ?? 0,
      user_id: map['user_id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      link: map['link'] ?? '',
      icon: map['icon'] ?? '',
      is_selected: map['is_selected']?.toInt() ?? 0,
      created_at: DateTime.parse(map['created_at']),
      updated_at: DateTime.parse(map['updated_at']),
      external_page_files: List<ExternalPageFile>.from(
          map['external_page_files']?.map((x) => ExternalPageFile.fromMap(x))),
    );
  }

  @override
  String toString() {
    return 'ExternalPageData(id: $id, user_id: $user_id, name: $name, link: $link, icon: $icon, is_selected: $is_selected, created_at: $created_at, updated_at: $updated_at, external_page_files: $external_page_files)';
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
      external_page_files,
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
      external_page_files: const []);
}
