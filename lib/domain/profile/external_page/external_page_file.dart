// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExternalPageFile extends Equatable {
  final int id;
  final int external_page_id;
  final String link;
  final DateTime created_at;
  final DateTime updated_at;
  const ExternalPageFile({
    required this.id,
    required this.external_page_id,
    required this.link,
    required this.created_at,
    required this.updated_at,
  });

  ExternalPageFile copyWith({
    int? id,
    int? external_page_id,
    String? link,
    DateTime? created_at,
    DateTime? updated_at,
  }) {
    return ExternalPageFile(
      id: id ?? this.id,
      external_page_id: external_page_id ?? this.external_page_id,
      link: link ?? this.link,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'external_page_id': external_page_id,
      'link': link,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
    };
  }

  factory ExternalPageFile.fromMap(Map<String, dynamic> map) {
    return ExternalPageFile(
      id: map['id']?.toInt() ?? 0,
      external_page_id: map['external_page_id']?.toInt() ?? 0,
      link: map['link'] ?? '',
      created_at: DateTime.parse(map['created_at']),
      updated_at: DateTime.parse(map['updated_at']),
    );
  }

  @override
  String toString() {
    return 'ExternalPageFile(id: $id, external_page_id: $external_page_id, link: $link, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  List<Object> get props {
    return [
      id,
      external_page_id,
      link,
      created_at,
      updated_at,
    ];
  }

  String toJson() => json.encode(toMap());

  factory ExternalPageFile.fromJson(String source) =>
      ExternalPageFile.fromMap(json.decode(source));
  factory ExternalPageFile.init() => ExternalPageFile(
      id: 0,
      external_page_id: 0,
      link: '',
      created_at: DateTime.now(),
      updated_at: DateTime.now());
}
