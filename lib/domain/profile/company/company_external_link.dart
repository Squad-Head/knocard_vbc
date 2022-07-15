import 'package:equatable/equatable.dart';

class CompanyExternalLinkEntity extends Equatable {
  final int id;
  final int companyId;
  final String title;
  final String color;
  final String link;
  final String status;

  const CompanyExternalLinkEntity(
      {required this.id,
      required this.companyId,
      required this.title,
      required this.color,
      required this.link,
      required this.status});

  CompanyExternalLinkEntity copyWith({
    int? id,
    int? companyId,
    String? title,
    String? color,
    String? link,
    String? status,
  }) {
    return CompanyExternalLinkEntity(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      title: title ?? this.title,
      color: color ?? this.color,
      link: link ?? this.link,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'company_id': companyId,
      'title': title,
      'color': color,
      'link': link,
      'status': status,
    };
  }

  factory CompanyExternalLinkEntity.fromMap(Map<String, dynamic> map) {
    return CompanyExternalLinkEntity(
      id: map['id']?.toInt() ?? 0,
      companyId: map['company_id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      color: map['color'] ?? '',
      link: map['link'] ?? '',
      status: map['status'] ?? '',
    );
  }

  @override
  String toString() {
    return 'CompanyExternalLinkEntity(id: $id, companyId: $companyId, title: $title, color: $color, link: $link, status: $status)';
  }

  @override
  List<Object> get props {
    return [
      id,
      companyId,
      title,
      color,
      link,
      status,
    ];
  }
}
