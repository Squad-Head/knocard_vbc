import 'package:equatable/equatable.dart';

class CompanyFeed extends Equatable {
  final int id;
  final int companyId;
  final String title;
  final String image;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CompanyFeed({
    required this.id,
    required this.companyId,
    required this.title,
    required this.image,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  CompanyFeed copyWith({
    int? id,
    int? companyId,
    String? title,
    String? image,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CompanyFeed(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'company_id': companyId,
      'title': title,
      'image': image,
      'description': description,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString()
    };
  }

  factory CompanyFeed.fromMap(Map<String, dynamic> map) {
    return CompanyFeed(
      id: map['id']?.toInt() ?? 0,
      companyId: map['company_id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  @override
  String toString() {
    return 'CompanyFeed(id: $id, companyId: $companyId, title: $title, image: $image, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      companyId,
      title,
      image,
      description,
      createdAt,
      updatedAt,
    ];
  }
}
