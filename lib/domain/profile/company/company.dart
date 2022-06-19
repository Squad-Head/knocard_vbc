// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final int id;
  final int user_id;
  final String profile_picture;
  final String name;
  final String tagline;
  final String business_phone;
  final String business_mobile_phone;
  final String fax;
  final String business_email_address;
  final String content;
  final String lng;
  final String lat;
  final String promotional_video;
  final int icon;
  final String title;
  final String description;
  final String street1;
  final String street2;
  final String city;
  final String state;
  final int zip_code;
  final String icon_url;
  final String thumbnail;
  final String business_page_title;
  const Company({
    required this.id,
    required this.user_id,
    required this.profile_picture,
    required this.name,
    required this.tagline,
    required this.business_phone,
    required this.business_mobile_phone,
    required this.fax,
    required this.business_email_address,
    required this.content,
    required this.lng,
    required this.lat,
    required this.promotional_video,
    required this.icon,
    required this.title,
    required this.description,
    required this.street1,
    required this.street2,
    required this.city,
    required this.state,
    required this.zip_code,
    required this.icon_url,
    required this.thumbnail,
    required this.business_page_title,
  });

  Company copyWith({
    int? id,
    int? user_id,
    String? profile_picture,
    String? name,
    String? tagline,
    String? business_phone,
    String? business_mobile_phone,
    String? fax,
    String? business_email_address,
    String? content,
    String? lng,
    String? lat,
    String? promotional_video,
    int? icon,
    String? title,
    String? description,
    String? street1,
    String? street2,
    String? city,
    String? state,
    int? zip_code,
    String? icon_url,
    String? thumbnail,
    String? business_page_title,
  }) {
    return Company(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      profile_picture: profile_picture ?? this.profile_picture,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      business_phone: business_phone ?? this.business_phone,
      business_mobile_phone:
          business_mobile_phone ?? this.business_mobile_phone,
      fax: fax ?? this.fax,
      business_email_address:
          business_email_address ?? this.business_email_address,
      content: content ?? this.content,
      lng: lng ?? this.lng,
      lat: lat ?? this.lat,
      promotional_video: promotional_video ?? this.promotional_video,
      icon: icon ?? this.icon,
      title: title ?? this.title,
      description: description ?? this.description,
      street1: street1 ?? this.street1,
      street2: street2 ?? this.street2,
      city: city ?? this.city,
      state: state ?? this.state,
      zip_code: zip_code ?? this.zip_code,
      icon_url: icon_url ?? this.icon_url,
      thumbnail: thumbnail ?? this.thumbnail,
      business_page_title: business_page_title ?? this.business_page_title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'profile_picture': profile_picture,
      'name': name,
      'tagline': tagline,
      'business_phone': business_phone,
      'business_mobile_phone': business_mobile_phone,
      'fax': fax,
      'business_email_address': business_email_address,
      'content': content,
      'lng': lng,
      'lat': lat,
      'promotional_video': promotional_video,
      'icon': icon,
      'title': title,
      'description': description,
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'zip_code': zip_code,
      'icon_url': icon_url,
      'thumbnail': thumbnail,
      'business_page_title': business_page_title,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      id: map['id']?.toInt() ?? 0,
      user_id: map['user_id']?.toInt() ?? 0,
      profile_picture: map['profile_picture'] ?? '',
      name: map['name'] ?? '',
      tagline: map['tagline'] ?? '',
      business_phone: map['business_phone'] ?? '',
      business_mobile_phone: map['business_mobile_phone'] ?? '',
      fax: map['fax'] ?? '',
      business_email_address: map['business_email_address'] ?? '',
      content: map['content'] ?? '',
      lng: map['lng'] ?? '',
      lat: map['lat'] ?? '',
      promotional_video: map['promotional_video'] ?? '',
      icon: map['icon']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      street1: map['street1'] ?? '',
      street2: map['street2'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      zip_code: map['zip_code']?.toInt() ?? 0,
      icon_url: map['icon_url'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      business_page_title: map['business_page_title'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Company(id: $id, user_id: $user_id, profile_picture: $profile_picture, name: $name, tagline: $tagline, business_phone: $business_phone, business_mobile_phone: $business_mobile_phone, fax: $fax, business_email_address: $business_email_address, content: $content, lng: $lng, lat: $lat, promotional_video: $promotional_video, icon: $icon, title: $title, description: $description, street1: $street1, street2: $street2, city: $city, state: $state, zip_code: $zip_code, icon_url: $icon_url, thumbnail: $thumbnail, business_page_title: $business_page_title)';
  }

  @override
  List<Object> get props {
    return [
      id,
      user_id,
      profile_picture,
      name,
      tagline,
      business_phone,
      business_mobile_phone,
      fax,
      business_email_address,
      content,
      lng,
      lat,
      promotional_video,
      icon,
      title,
      description,
      street1,
      street2,
      city,
      state,
      zip_code,
      icon_url,
      thumbnail,
      business_page_title,
    ];
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source));

  factory Company.init() => const Company(
      id: 0,
      user_id: 0,
      profile_picture: '',
      name: '',
      tagline: '',
      business_phone: '',
      business_mobile_phone: '',
      fax: '',
      business_email_address: '',
      content: '',
      lng: '',
      lat: '',
      promotional_video: '',
      icon: 0,
      title: 'title',
      description: '',
      street1: '',
      street2: '',
      city: '',
      state: '',
      zip_code: 0,
      icon_url: '',
      thumbnail: '',
      business_page_title: '');
}
